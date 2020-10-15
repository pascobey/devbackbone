class ProjectsController < ApplicationController

  before_action :authenticate_user!

  def new
    # reflex_variables -- assigned at the top of the view to give Relfexes access
    # reflex_steps are a way to give the page flow
    @reflex_steps ||= {
      'name the project' => true,
      'add team subsets' => false,
      'choose roles' => false,
      'specify team subset' => false
    }
    @project_name ||= 'Project Name'
    @possible_roles ||= {
      'product_owner' => true,
      'project_manager' => false, 
      'scrum_master' => false,
      'developer' => false
    }
    @possible_development_team_subsets = [
      'programmers', 'ux_ui_designers', 'writers', 'testers',
      'dev_ops', 'subject_matter_experts', 'legal'
    ]
    @development_team_subsets ||= {}
    # boolean to keep invalid form from submission
    @form_valid = false
    # a form is needed for a new project
    @project = Project.new
  end

  def project_params
    params.require(:project).permit(:backbone_document)
  end
end
