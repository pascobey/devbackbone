class ProjectDashboardReflex < ApplicationReflex

    def toggle_dashboard_item 
        reinstantiate_vars(element.dataset[:vars])
        @reflex_pages['dashboard-items'].each do |p, b|
            if p == element.dataset[:page]
                @reflex_pages['dashboard-items'][p] = true
            else
                @reflex_pages['dashboard-items'][p] = false
            end
        end
    end

end