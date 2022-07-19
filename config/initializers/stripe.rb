
Rails.configuration.stripe = {
    :publishable_key => Rails.application.credentials.production[:public_key],
  
    :secret_key      => Rails.application.credentials.production[:private_key]
   }
   Stripe.api_key =  Rails.application.credentials.production[:private_key]