class UserMailer < ApplicationMailer
	 default from: "benjie.dayco@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
        :to => 'benjie.dayco@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @user = user
    @url ='https://GamesManila.herokuapp.com/signup'
    mail(to: @user.email, subject: 'Welcome to GamesManila!')
  end

  def ordered(user, product)
    @user = user
    @product = product
    mail(:to => @user.email,:subject => "GamesManila: Payment confirmation for #{product.name}")
  end
end
