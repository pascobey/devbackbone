class UserStory < ApplicationRecord

    def sprint_status_safe
        if self.sprint_status.class != Hash
            JSON.parse(self.sprint_status.gsub('=>', ':')).stringify_keys
        else
            self.sprint_status
        end
    end

end

