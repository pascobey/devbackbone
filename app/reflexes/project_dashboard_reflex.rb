class ProjectDashboardReflex < ApplicationReflex

    def toggle_dashboard_item
        reinstantiate_vars(element.dataset[:vars])
        @reflex_pages['dashboard-items'].each do |p, b|
            if b == true || b == false
                if p == element.dataset[:page]
                    @reflex_pages['dashboard-items'][p] = true
                else
                    @reflex_pages['dashboard-items'][p] = false
                end
            end
        end
    end

    def dismiss_weakness
        reinstantiate_vars(element.dataset[:vars])
        @dismissed << element.dataset[:weakness]
    end

    def hide_meta
        reinstantiate_vars(element.dataset[:vars])
        @hidden_types << element.dataset[:meta]
    end

    def show_meta
        reinstantiate_vars(element.dataset[:vars])
        @hidden_types.delete(element.dataset[:meta])
    end

    def build_post
        reinstantiate_vars(element.dataset[:vars])
        @post = element.value
    end

    def post
        reinstantiate_vars(element.dataset[:vars])
        project = Project.find(params[:id])
        Entry.create(change_log_id: ChangeLog.find_by(project_id: project.id).id, committer_id: @user_id, message: element.dataset[:message], type_meta: 'post')
    end
end