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
      # return false unless @profile.save
      # if @current_user.blank? && @email.blank?
      #   @profile.errors.add(:base, 'E-mail must be not empty')
      #   return false
      # end
      @current_user ? confirm_user : create_user
    end
  rescue => e
    @error = e.message
    false
  end

  private

  def create_user
    @current_user = User.create!(email: @email, password: SecureRandom.urlsafe_base64(12))
    # Здесь надо отправлять письмо с confirmation от юзера
    # UserMailer.registration_confirmation(@user).deliver_now
    confirm_user
    true
  end

  def confirm_user
    @profile.update(user: @current_user)
    @profile.confirm! if @current_user.confirmed?
    #   Devise::Mailer.confirmation_instructions(@current_user).deliver
    true
  end
end
