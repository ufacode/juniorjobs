# frozen_string_literal: true
class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]

  def index
    @profiles = Profile.all
  end

  def show; end

  def new
    @profile = Profile.new
    @user = user_signed_in? ? current_user : @profile.build_user
  end

  def edit; end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    if user_signed_in?
      UserMailer.successful_create(@user).deliver_now
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      @user = User.new(user_params)
      @user.save
      UserMailer.registration_confirmation(@user).deliver_now
      redirect_to :index, flash[:notice] = 'To confirm your profile, check email'
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:fio, :name, :description, :money_from, :money_to, :location, :category,
                                    :expectations, :skype, :site, :linkedin, :photo, :cv, user_attributes: [:email])
  end
end
