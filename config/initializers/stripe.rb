
Rails.configuration.stripe = {
    :publishable_key => Rails.application.credentials.production[:stripe_public_key],
  
    :secret_key      => Rails.application.credentials.production[:stripe_private_key]
   }
   Stripe.api_key =  Rails.application.credentials.production[:stripe_private_key]