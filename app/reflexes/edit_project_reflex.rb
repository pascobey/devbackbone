class EditProjectReflex < ApplicationReflex
    
    def hide_reflex_pages
        @reflex_pages.each do |page, b|
            if b.class == Hash
                b.each do |button, b|
                    if @reflex_pages['buttons'][button]
                        @reflex_pages['buttons'][button] = !@reflex_pages['buttons'][button]
                    end
                end
            else
                @reflex_pages[page] = false
            end
        end
    end

    def show_page
        reinstantiate_vars(element.dataset[:vars])
        hide_reflex_pages
        @reflex_pages['buttons'][element.dataset[:button]] = true
        @reflex_pages[element.dataset[:button]] = true
    end

    def toggle_page_item
        reinstantiate_vars(element.dataset[:vars])
        @reflex_pages["#{element.value}"] = !@reflex_pages["#{element.value}"]
    end

    def edit_search_query
        reinstantiate_vars(element.dataset[:vars])
        @search_information = element.value.downcase
    end

    def change_leader_role
        reinstantiate_vars(element.dataset[:vars])
        @search_information = ''
        @backbone_document['leaders'][element.dataset[:role]] = [ element.dataset[:user_id].to_i ]
        project = Project.find(params[:id])
        project.update(backbone_document: @backbone_document)
        Entry.create(change_log_id: ChangeLog.find_by(project_id: project.id).id, committer_id: @user_id, message: "#{element.dataset[:role].gsub('_', ' ')} changed to #{Profile.find_by(user_id: element.dataset[:user_id].to_i).user_information_safe['first_name']} #{Profile.find_by(user_id: element.dataset[:user_id].to_i).user_information_safe['last_name']}.", type_meta: 'team')
    end

    def add_user_to_subset
        reinstantiate_vars(element.dataset[:vars])
        @search_information = ''
        @backbone_document['development_team'][element.dataset[:subset]] << element.dataset[:user_id].to_i
        project = Project.find(params[:id])
        project.update(backbone_document: @backbone_document)
        Entry.create(change_log_id: ChangeLog.find_by(project_id: project.id).id, committer_id: @user_id, message: "#{Profile.find_by(user_id: element.dataset[:user_id].to_i).user_information_safe['first_name']} #{Profile.find_by(user_id: element.dataset[:user_id].to_i).user_information_safe['last_name']} added to #{element.dataset[:subset]}.", type_meta: 'team')
    end

    def remove_user_from_subset
        reinstantiate_vars(element.dataset[:vars])
        @backbone_document['development_team'][element.dataset[:subset]].delete(element.dataset[:user_id].to_i)
        project = Project.find(params[:id])
        project.update(backbone_document: @backbone_document)
        Entry.create(change_log_id: ChangeLog.find_by(project_id: project.id).id, committer_id: @user_id, message: "#{Profile.find_by(user_id: element.dataset[:user_id].to_i).user_information_safe['first_name']} #{Profile.find_by(user_id: element.dataset[:user_id].to_i).user_information_safe['last_name']} removed from #{element.dataset[:subset]}.", type_meta: 'team')
    end

    def notify_schedule_change
        reinstantiate_vars(element.dataset[:vars])
        Entry.create(change_log_id: ChangeLog.find_by(project_id: params[:id]).id, committer_id: @user_id, message: "Sprint #{element.dataset[:item]} set to #{element.dataset[:datetime]}.", type_meta: 'schedule')
    end

    def change_date
        reinstantiate_vars(element.dataset[:vars])
        if element.value != ''
            @backbone_document['sprint'][element.dataset[:item]] = Time.parse(element.value).to_s
            project = Project.find(params[:id])
            project.update(backbone_document: @backbone_document)
        end
    end

    def set_user_story_story
        reinstantiate_vars(element.dataset[:vars])
        @new_user_story['story'] = element.value
    end

    def set_user_story_value
        reinstantiate_vars(element.dataset[:vars])
        @new_user_story['value'] = element.value
    end

    def set_user_story_color
        reinstantiate_vars(element.dataset[:vars])
        @new_user_story['color'] = element.value
    end

    def add_user_story
        toggle_page_item
        project = Project.find(params[:id])
        story = UserStory.create(project_id: project.id, story: @new_user_story['story'], value: @new_user_story['value'], editor_user_id: @user_id, color: @new_user_story['color'])
        position = UserStory.where(project_id: project.id).size
        sticky = Sticky.create(project_id: project.id, position: position, user_story_id: story.id, category_id: nil)
        Entry.create(change_log_id: ChangeLog.find_by(project_id: project.id).id, committer_id: @user_id, message: "New user story: #{story.story}", type_meta: 'backlog')
    end

    def toggle_user_story_approval
        reinstantiate_vars(element.dataset[:vars])
        story = UserStory.find(element.dataset[:story_id])
        appr = story.approved
        story.update(approved: !appr)
    end

end