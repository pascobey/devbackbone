class ProjectsController < ApplicationController

  before_action :authenticate_user!

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
    # reflex_steps are a way to give the page flow
    @reflex_steps ||= [
      { 'current step' => 1 },
      { 'name the project' => true },
      { 'add team subsets' => false },
      { 'choose roles' => false },
      { 'specify team subset' => false }
    ]
    # a form is needed for a new project
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project), notice: "Project saved!"
    else
      render :new, alert: 'Project unable to save, try again.'
    end
  end

  private
    def project_params
      params.require(:project).permit(:backbone_document)
    end
end
