class ProfileController < ApplicationController
  def index
  @user=current_user
  @houses = House.all
  end

  def edit
  end

  def show
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'success'
    else
      render :index
    end
  end

  private

  def profile_params
    params.fetch(:profile).permit(:avatar,:name,:email,:telephone)
  end
end
