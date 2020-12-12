class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :verify_access, only: [:show]


  def show
    @current_user = current_user
    @project = Project.find(params[:id])
    @backbone_document ||= @project.backbone_document_safe
    @weaknesses = @project.get_weaknesses
    @backbone_document['leaders']['product_owner'].include?(current_user.id) ? (@owner_editing_privileges = true) : (@owner_editing_privileges = false)
    @backbone_document['leaders']['scrum_master'].include?(current_user.id) ? (@scrum_editing_privileges = true) : (@scrum_editing_privileges = false)
    @reflex_pages ||= {
      'buttons' => {
        'dashboard' => true,
        'backlog' => false,
        'sprint' => false
      },
        'dashboard' => true,
        'dashboard-items' => {
          'activity' => true,
          'team' => false,
          'schedule' => false
        }
    }
    @search_information ||= ''
    @new_user_story ||= {
      'story' => 'As a <type of user>, I want <some goal> so that <some reason>.',
      'value' => 0,
      'editor' => @current_user.id,
      'approved' => false,
      'color' => 1
    }
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
      'scrum_master' => false,
      'developer' => false
    }
    @development_team_subsets ||= {}
    # the JSON to be stored
    @backbone_document ||= {}
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
      ChangeLog.create(project_id: @project.id)
      creator_profile = Profile.find_by(user_id: current_user.id)
      creator_information = creator_profile.user_information_safe
      roles = []
      backbone_document = @project.backbone_document_safe
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
        redirect_to(profile_path(current_user.id), alert: "Project with id: #{params[:id]} does not exist!")
      else
        backbone_document = Project.find(params[:id]).backbone_document_safe
        users_array = []
        backbone_document['leaders'].each do |role, user_id|
          users_array << user_id.first if !users_array.include?(user_id.first)
        end
        backbone_document['development_team'].each do |subset, members|
          members.each do |user_id|
            users_array << user_id if !users_array.include?(user_id)
          end
        end
        if !users_array.include?(current_user.id)
            redirect_to new_project_path, alert: "You don't seem to have access to project #{params[:id]}..."
        end
      end
    end

    def project_params
      params.require(:project).permit(:project_name, :backbone_document)
    end

end
