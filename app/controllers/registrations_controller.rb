class RegistrationsController < Devise::RegistrationsController
  
  prepend_before_action :check_captcha, only: [:create]
  def create
    super
    UserMailer.welcome(@user).deliver unless @user.invalid?
  end

  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."
        respond_with_navigational(resource) { render :new }
      end 
    end

end