class EditProjectReflex < ApplicationReflex
    def reinstantiate_vars(vars_hash)
        @backbone_document = vars_hash['backbone_document']
        @search_information = vars_hash['search_information']
        @reflex_pages = vars_hash['reflex_pages']
        @project_edited = vars_hash['project_edited']
    end

    def rehash_vars(vars_string)
        return JSON.parse(vars_string).stringify_keys
    end

    def hide_reflex_pages
        @reflex_pages.each do |page, b|
            if b.class == Hash
                b.each do |button, b|
                    @reflex_pages['buttons'][button] = false
                end
            else
                @reflex_pages[page] = false
            end
        end
    end

    def show_page
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        hide_reflex_pages
        @reflex_pages['buttons'][element.value] = true
        @reflex_pages[element.value] = true
    end

    def toggle_page_item
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @reflex_pages["#{element.value}"] = !@reflex_pages["#{element.value}"]
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

    def change_date
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        if element.value != ''
            date_items = element.value.split('/')
            if date_items.size == 3
                if @backbone_document['sprint'][element.dataset[:item]] == ''
                    time = Time.now.to_s.split(' ')[1]
                else
                    time = @backbone_document['sprint'][element.dataset[:item]].split(' ')[1]
                end
                @backbone_document['sprint'][element.dataset[:item]] = Time.parse("#{date_items[2]}-#{date_items[0]}-#{date_items[1]}T#{time}")
                @project_edited = true
            end
        end
    end

    def change_time
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        if element.value.include?(':')
            if @backbone_document['sprint'][element.dataset[:item]] == ''
                date = Time.now.to_s.split(' ')[0]
            else
                if @backbone_document['sprint'][element.dataset[:item]].include?('T')
                    date = @backbone_document['sprint'][element.dataset[:item]].split('T')[0]
                else
                    date = @backbone_document['sprint'][element.dataset[:item]].split(' ')[0]
                end
            end
            @backbone_document['sprint'][element.dataset[:item]] = Time.parse("#{date}T#{element.value}").to_s.gsub(':', '|')
        end
    end

    def remove_user_from_subset
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @backbone_document['development_team'][element.dataset[:subset]].delete(element.dataset[:user_id].to_i)
        @project_edited = true
    end

end