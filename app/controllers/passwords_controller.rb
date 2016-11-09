class PasswordsController < Devise::PasswordsController
  
  def create
    if verify_recaptcha
      self.resource = resource_class.send_reset_password_instructions(resource_params)
      yield resource if block_given?

      if successfully_sent?(resource)
        respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
      else
        respond_with(resource)
      end
    else
      self.resource = resource_class.send_reset_password_instructions(resource_params)
      clean_up_passwords(resource)
      flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."
      #flash.delete :recaptcha_error
      respond_with_navigational(resource) { render :new }
    end
  end
  
end