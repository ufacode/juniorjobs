# frozen_string_literal: true
class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @profiles = Profile.all
    # if params[:my]
    #   @profiles = @profiles.where(user: current_user)
    #   render 'my_index'
    # end
  end

  def show; end

  def new
    @profile = Profile.new
    # @user = user_signed_in? ? current_user : @profile.build_user
  end

  def edit; end

  def create
    @profile_creator = ProfileCreate.new(profile_params, params[:email], current_user)
    done = @profile_creator.perform!
    @profile = @profile_creator.profile

    if done
      if user_signed_in?
        redirect_to profile_path(@profile), notice: 'Profile was successfully created.'
      else
        redirect_to profiles_path, notice: 'To confirm your profile, check email'
      end
    else
      @profile.errors.add(:base, @profile_creator.error) if @profile_creator.error
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

  def hide
    update_attribute!(:displayed, false)
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params
      .require(:profile)
      .permit(
        :fio, :name, :description, :money_from, :money_to, :location, :category,
        :expectations, :skype, :site, :linkedin, :photo, :cv
      )
  end
end
