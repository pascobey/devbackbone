class EditProjectReflex < ApplicationReflex
    def reinstantiate_vars(vars_hash)
        @backbone_document = vars_hash['backbone_document']
        @search_information = vars_hash['search_information']
        @reflex_page_buttons = vars_hash['reflex_page_buttons']
        @reflex_page_items = vars_hash['reflex_page_items']
        @project_edited = vars_hash['project_edited']
    end

    def rehash_vars(vars_string)
        return JSON.parse(vars_string).stringify_keys
    end

    def hide_all_reflex_pages
        @reflex_page_items.each do |page, b|
            @reflex_page_items[page] = false
        end
        @reflex_page_buttons.each do |button, b|
            @reflex_page_buttons[button] = false
        end
    end

    def finish_edit
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @reflex_pages[element.dataset[:page]] = false
    end

    def show_page
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        hide_all_reflex_pages
        @reflex_page_buttons["#{element.value}"] = true
        @reflex_page_items["#{element.value} details"] = true
    end

    def show_edit_leader
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @reflex_pages["editing #{element.dataset[:role]}"] = true
    end

    def show_edit_subset
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @reflex_pages["editing #{element.dataset[:subset]}"] = true
    end

    def edit_search_query
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @search_information = element.value.downcase
    end

    def change_leader_role
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @search_information = ''
        @backbone_document['leaders'][element.dataset[:role]] = [ element.dataset[:user_id].to_i ]
        @project_edited = true
    end

    def add_user_to_subset
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @search_information = ''
        @backbone_document['development_team'][element.dataset[:subset]] << element.dataset[:user_id].to_i
        @project_edited = true
    end

    def remove_user_from_subset
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @backbone_document['development_team'][element.dataset[:subset]].delete(element.dataset[:user_id].to_i)
        @project_edited = true
    end

end