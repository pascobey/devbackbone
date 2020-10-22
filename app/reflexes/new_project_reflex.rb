class NewProjectReflex < ApplicationReflex
    def reinstantiate_vars(vars_hash)
        @user_id = vars_hash['user_id']
        @project_name = vars_hash['project_name']
        @possible_roles = vars_hash['possible_roles']
        @development_team_subsets = vars_hash['development_team_subsets']
        @reflex_steps = vars_hash['reflex_steps']
        @errors = vars_hash['errors']
        @backbone_document = vars_hash['backbone_document']
    end

    def update_backbone_document
        leaders = {
            'product_owner' => [],
            'scrum_master' => []
        }
        @possible_roles.each do |role, bool|
            if @possible_roles[role] && leaders.has_key?(role)
                leaders[role] << @user_id
            end
        end
        @backbone_document = {
            'project_name' => @project_name,
            'leaders' => {
                'product_owner' => leaders['product_owner'],
                'scrum_master' => leaders['scrum_master']
            },
            'development_team' => @development_team_subsets
        }
    end


    def rehash_vars(vars_string)
        return JSON.parse(vars_string).stringify_keys
    end

    def set_project_name
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        if element.value.strip != ''
            @project_name = element.value
        end
        if Project.find_by(project_name: @project_name)
            @errors['project_name'] << 'Sorry, that name has been taken and is unavailable'
        end
        update_backbone_document
    end

    def toggle_team_subset
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        if @development_team_subsets.key?(element.value)
            @development_team_subsets.delete(element.value)
        else
            @development_team_subsets[element.value] = []
        end
        update_backbone_document
    end

    def toggle_role_boolean
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @possible_roles[element.value] = !@possible_roles[element.value]
        if element.value == 'developer'
            @reflex_steps[4]['specify team subset'] = !@reflex_steps[4]['specify team subset']
        end
        update_backbone_document
    end

    def set_development_role
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @development_team_subsets.each do |subset, members|
            @development_team_subsets[subset] = []
        end
        @development_team_subsets[element.dataset[:subset]] << @user_id
        update_backbone_document
    end

    def step_forward
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @reflex_steps[@reflex_steps[0]['current step']].each do |desc, bool|
            @reflex_steps[@reflex_steps[0]['current step']][desc] = !bool
        end
        @reflex_steps[0]['current step'] = @reflex_steps[0]['current step'] + 1
        @reflex_steps[@reflex_steps[0]['current step']].each do |desc, bool|
            @reflex_steps[@reflex_steps[0]['current step']][desc] = !bool
        end
    end

    def step_backward
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @reflex_steps[@reflex_steps[0]['current step']].each do |desc, bool|
            @reflex_steps[@reflex_steps[0]['current step']][desc] = !bool
        end
        @reflex_steps[0]['current step'] = @reflex_steps[0]['current step'] - 1
        @reflex_steps[@reflex_steps[0]['current step']].each do |desc, bool|
            @reflex_steps[@reflex_steps[0]['current step']][desc] = !bool
        end
    end

end