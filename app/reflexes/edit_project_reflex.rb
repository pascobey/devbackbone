class EditProjectReflex < ApplicationReflex
    def reinstantiate_vars(vars_hash)
        @backbone_document = vars_hash['backbone_document']
        @users_array = vars_hash['users_array']
        @search_information = vars_hash['search_information']
        @reflex_pages = vars_hash['reflex_pages']
        @project_edited = vars_hash['project_edited']
    end

    def rehash_vars(vars_string)
        return JSON.parse(vars_string).stringify_keys
    end

    def hide_all_reflex_pages
        @reflex_pages.each do |page, b|
            page = false
        end
    end

    def show_team_details
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        hide_all_reflex_pages
        @reflex_pages['team details'] = true
    end

    def show_edit_leader
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @reflex_pages["editing #{element.dataset[:role]}"] = true
    end

    def edit_search_query
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @search_information = element.value
    end

    def change_leader_role
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @search_information = ''
        @reflex_pages["editing #{element.dataset[:role].gsub('_', ' ')}"] = false
        @backbone_document['leaders'][element.dataset[:role]] = element.dataset[:user]
        if !@users_array.include?(element.dataset[:user])
            @users_array << element.dataset[:user]
        end
        @project_edited = true
    end

end