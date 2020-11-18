class EditProfileReflex < ApplicationReflex

    def set_information_field
        @user_information = JSON.parse(element.dataset[:user_information].gsub('=>', ':')).stringify_keys
        field_helper = element.id.split('-')
        if field_helper.size == 2
            @user_information["#{field_helper[0]}_#{field_helper[1]}"] = element.value
        elsif field_helper.size == 3
            @user_information[field_helper[0]][field_helper[1]] = element.value
        end
    end

end