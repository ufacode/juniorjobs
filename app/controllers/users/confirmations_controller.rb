# frozen_string_literal: true
class ConfirmationsController < DeviseController
  protected

  def do_confirm
    @confirmable.confirm
    set_flash_message :notice, :confirmed
    self.resource.profiles.find_each do |profile|
      profile.confirm!
    end
    sign_in_and_redirect(resource_name, @confirmable)
  end
end
