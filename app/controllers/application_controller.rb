class ApplicationController < ActionController::Base

    before_action :find_profile

    def find_profile
        if user_signed_in?
            if Profile.where(user_id: current_user.id) == []
                redirect_to profile_path(current_user.id), notice: 'Please create a user profile first.'
            end
        end
    end

end
