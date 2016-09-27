if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_J4vkZepZSraNLj0yzBGPfPij',
    :secret_key => 'sk_test_iJOa0RfaIQ1Te0ajFkFQJmkj'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]