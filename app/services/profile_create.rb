# frozen_string_literal: true
class ProfileCreate
  attr_reader :error, :profile

  def initialize(params, email, current_user)
    @params = params
    @email = email
    @current_user = current_user
  end

  def perform!
    @profile = Profile.new(@params)
    return false unless @profile.save

    @current_user ? create_profile_for_user : create_profile_and_user
  rescue => e
    @error = e.message
    false
  end

  private

  def create_profile_for_user
    @profile.user = @current_user
    @profile.confirm!
    true
  end

  def create_profile_and_user
    @user = User.create(email: @email, password: SecureRandom.urlsafe_base64(12))
    # Здесь надо отправлять письмо с confirmation от юзера
    # UserMailer.registration_confirmation(@user).deliver_now
    true
  end
end
