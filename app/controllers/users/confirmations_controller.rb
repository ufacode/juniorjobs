# frozen_string_literal: true
class Users::ConfirmationsController < Devise::ConfirmationsController
  after_action :set_profiles, only: [:show]

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      set_flash_message!(:notice, :confirmed)
      # respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
      respond_with_navigational(resource) { sign_in_and_redirect resource }
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity) { render :new }
    end
  end

  private

  def set_profiles
    return unless resource.errors.empty?
    resource.profiles.find_each(&:confirm!)
  end
end
