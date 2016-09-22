# frozen_string_literal: true
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    '/user/registration' # Or :prefix_to_your_route
  end
end
