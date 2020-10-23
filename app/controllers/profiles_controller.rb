class ProfilesController < ApplicationController
  
  before_action :authenticate_user!

  def show
    if !Profile.find(params[:id])
      redirect_to root, alert: "Profile #{params[:id]} does not exist!"
    else
      @profile = Profile.find(params[:id])
    end
  end

  def edit
    if !Profile.exists?(user_id: current_user.id)
      @profile = Profile.create(user_id: current_user.id, user_information: {
        'first_name' => '',
        'last_name' => '',
        'phone_number' => '',
        'user_bio' => '',
        'externals' => {
          'github' => '',
          'twitter' => '',
          'facebook' => '',
          'instagram' => '',
          'site' => ''
        },
        'projects' => []
      })
    else
      @profile = Profile.find_by(user_id: current_user.id)
    end
    if Profile.find(params[:id]) != @profile
      redirect_to(edit_profile_path(@profile), alert: "We've redirected you to your profile...")
    end
    @user_information ||= @profile.user_information
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      redirect_to profile_path(@profile)
    else
      redirect_to edit_profile_path(@profile)
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:user_information, :profile_image)
    end
end
