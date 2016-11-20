# frozen_string_literal: true
class ProfileCreate
  attr_reader :error, :profile

  def initialize(params, email, current_user)
    @params = params
    @email = email
    @current_user = current_user
  end

  def perform!
    Profile.transaction do
      @profile = Profile.create!(@params)
      @current_user ? confirm_user : create_user
    end
  rescue => e
    @error = e.message
    false
  end

  private

  def create_user
    @current_user = User.create!(email: @email, password: SecureRandom.urlsafe_base64(12))
    confirm_user
    true
  end

  def confirm_user
    @profile.update(user: @current_user)
    @profile.confirm! if @current_user.confirmed?
    true
  end
end
