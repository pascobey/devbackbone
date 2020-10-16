class ProfilesController < ApplicationController
  
  before_action :authenticate_user!

  def show
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def edit
    if !Profile.find_by(user_id: current_user.id)
      @profile  = Profile.create(user_id: current_user.id, user_information: {
        'first_name' => '',
        'last_name' => '',
        'phone_number' => '',
        'bio' => '',
        'externals' => {
          'github' => '',
          'twitter' => '',
          'facebook' => '',
          'instagram' => '',
          'site' => ''
        }
      })
    else
      @profile = Profile.find_by(user_id: current_user.id)
    end
    # @user_information = @profile.user_information
    @user_information = {
      'first_name' => '',
      'last_name' => '',
      'phone_number' => '',
      'bio' => '',
      'externals' => {
        'github' => '',
        'twitter' => '',
        'facebook' => '',
        'instagram' => '',
        'site' => ''
      }
    }
  end

  def update
    raise params.inspect
    # @profile = Profile.find_by(user_id: current_user.id)
    # @profile.update(user_information: params[:user_information], profile_image: params[:profile_image])
    # redirect_to profile_path(@profile)
  end

  private
    def profile_params
      params.require(:profile).permit(:user_information, :profile_image)
    end
end
