# frozen_string_literal: true
class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def show; end

  def new
    @profile = Profile.new
  end

  def edit; end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
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
    params.require(:profile).permit(:fio, :name, :descriprion, :money_from, :money_to, :location, :category,
                                    :expectations, :skype, :site, :linkedin, :photo, :cv)
  end
end
