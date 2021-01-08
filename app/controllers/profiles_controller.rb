class ProfilesController < ApplicationController
  
  before_action :authenticate_user!
  skip_before_action :find_profile

  def show
    if !Profile.exists?(params[:id])
      redirect_to(edit_profile_path(params[:id]), alert: "No profile information found!")
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
      @profile.profile_image.attach(io: File.open(File.expand_path(__FILE__).split('/controllers')[0] + '/assets/images/default_profile.jpg'), filename: 'default_profile.jpg')
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
      redirect_to profile_path(@profile), alert: 'Profile update successful.'
    else
      redirect_to edit_profile_path(@profile), alert: 'Profile update unsuccessful.'
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:user_information, :profile_image)
    end
end
