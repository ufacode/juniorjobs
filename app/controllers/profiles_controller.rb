# frozen_string_literal: true
class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
    end
  end

# PATCH/PUT /profiles/1
# PATCH/PUT /profiles/1.json
def update
  if @profile.update(profile_params)
    redirect_to @profile, notice: 'Profile was successfully updated.'
  else
    render :new
  end
end

# DELETE /profiles/1
# DELETE /profiles/1.json
def destroy
  @profile.destroy
  redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
end

  private

# Use callbacks to share common setup or constraints between actions.
def set_profile
  @profile = Profile.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def profile_params
  params.require(:profile).permit(:fio, :name, :descriprion, :money_from, :money_to, :location, :category,
                                  :expectations, :skype, :site, :linkedin, :photo, :cv)
end
