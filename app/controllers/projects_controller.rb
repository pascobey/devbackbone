class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :verify_access, only: [:show]

  def show
    @current_user = current_user
    @project = Project.find(params[:id])
    @backbone_document ||= @project.get_backbone_document
    @users_array ||= @project.users_array.split
    @weaknesses = @project.get_weaknesses(@backbone_document)
    @reflex_pages ||= {
      'team details' => false,
      'editing product owner' => false,
      'editing project manager' => false,
      'editing scrum master' => false
    }
    @backbone_document['leaders']['product_owner'].include?(current_user.id) ? (@editing_privledges = true) : (@editing_privledges = false)
    @project_edited ||= false
    @search_information ||= ''
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to(project_path(@project), alert: 'Changes Successfully Saved!')
    else
      redirect_to(project_path(@project), alert: 'Changes Failed to Save!')
    end
  end

  def new
    @current_user = current_user
    @possible_development_team_subsets = [
      'programmers', 'ux_ui_designers', 'writers', 'testers',
      'dev_ops', 'subject_matter_experts', 'legal'
    ]
    # reflex_variables -- assigned at the top of the view to give Relfexes access
    @project_name ||= 'Project Name'
    @possible_roles ||= {
      'product_owner' => false,
      'project_manager' => false, 
      'scrum_master' => false,
      'developer' => false
    }
    @development_team_subsets ||= {}
    # the JSON to be stored
    @backbone_document ||= {}
    # a list of users in the project to quickly authorize access to the project
    @users_array = [ 0, current_user.id ]
    # reflex_steps are a way to give the page flow
    @reflex_steps ||= [
      { 'current step' => 1 },
      { 'name the project' => true },
      { 'add team subsets' => false },
      { 'choose roles' => false },
      { 'specify team subset' => false }
    ]
    @errors ||= {
      'project_name' => []
    }
    # a form is needed for a new project
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      creator_profile = Profile.find_by(user_id: current_user.id)
      creator_information = JSON.parse(creator_profile.user_information.gsub('=>', ':')).stringify_keys
      roles = []
      backbone_document = JSON.parse(@project.backbone_document.gsub('=>', ':')).stringify_keys
      backbone_document['leaders'].each do |role, user|
        if user == current_user.id
          roles << role
        end
      end
      backbone_document['development_team'].each do |subset, members|
        if members.include?(current_user.id)
          roles << subset
        end
      end
      creator_information['projects'] << {
        @project.id => { 
          'roles' => roles
        }
      }
      creator_profile.update(user_information: creator_information)
      redirect_to project_path(@project), notice: "Project saved!"
    else
      render :new, alert: 'Project unable to save, try again.'
    end
  end


  private

    def verify_access
      if !Project.exists?(params[:id])
        render :new, alert: "Project with id: #{params[:id]} does not exist!"
      else
        if !Project.find(params[:id]).users_array.split(' ').map(&:to_i).include?(current_user.id)
            redirect_to new_project_path, alert: "You don't seem to have access to project #{params[:id]}..."
        end
      end
    end

    def project_params
      params.require(:project).permit(:backbone_document, :users_array)
    end

end
