# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_update_path_for(_resource)
    edit_user_registration_path
  end

  def set_flash_message_for_update(resource, prev_unconfirmed_email)
    return unless is_flashing_format?

    flash_key = if update_needs_confirmation?(resource, prev_unconfirmed_email)
                  :update_needs_confirmation
                elsif sign_in_after_change_password?
                  :updated
                else
                  :updated_but_not_signed_in
                end
    set_flash_message :notice, flash_key, now: turbo_frame_request?
  end
end
