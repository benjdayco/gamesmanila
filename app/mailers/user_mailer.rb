class UserMailer < ApplicationMailer
	 default from: "benjie.dayco@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'benjie.dayco@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  def new_registration(user)
  	@user = user
  	message = "Welcome to Games Manila."
  	mail(:to => @user.email, :subject => "Welcome to Games Manila!!!")
  end
end
