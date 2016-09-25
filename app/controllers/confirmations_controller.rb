# frozen_string_literal: true
class ConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(_resource_name, _resource)
    your_new_after_confirmation_path
  end
  def state_transition
  	profile = Profile.find(params [:user_id])
  	profile.confirm!
  end
end
