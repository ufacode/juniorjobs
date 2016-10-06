# frozen_string_literal: true
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    'new_user_registration_path'
    # RegistrationMailer.password(user, generated_password).deliver
  end
end
