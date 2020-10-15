class NewProjectReflex < ApplicationReflex
    def reinstantiate_vars(vars_hash)
        puts
        puts 
        puts @project_name = vars_hash['project_name']
        puts @possible_roles = vars_hash['possible_roles']
        puts @development_team_subsets = vars_hash['development_team_subsets']
        puts @reflex_steps = vars_hash['reflex_steps']
        puts @form_valid = vars_hash['form_valid']
        puts
        puts
    end


    def rehash_vars(vars_string)
        return JSON.parse(vars_string).stringify_keys
    end

    def set_project_name
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        if element.value.strip != ''
            @project_name = element.value
        end
    end

    def toggle_team_subset
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        if @development_team_subsets.key?(element.value)
            @development_team_subsets.delete(element.value)
        else
            @development_team_subsets[element.value] = []
        end
    end

    def toggle_role_boolean
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @possible_roles[element.value] = !@possible_roles[element.value]
        if element.value == 'developer'
            @reflex_steps['specify team subset'] = !@reflex_steps['specify team subset']
        end
    end

    def step_forward
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @reflex_steps[element.dataset[:this_step]] = false
        @reflex_steps[element.dataset[:next_step]] = true
    end

    def step_backward
        reinstantiate_vars(rehash_vars(element.dataset[:vars]))
        @reflex_steps[element.dataset[:this_step]] = false
        @reflex_steps[element.dataset[:last_step]] = true
    end

end