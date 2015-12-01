class ProfilesController < ApplicationController

 
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    if @profile.save
      redirect_to projects_path
    else 
      render action: "new"
    end
  end
  
  def show
    @profile = current_user.profile
  end
  
  def edit
    @profile = current_user.profile
  end
  
  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      redirect_to profile_path(@profile) 
    else 
      render action: "edit"
    end
  end

  private
  def profile_params
    params[:profile].permit(:first_name, :last_name, :bio)
  end
end
