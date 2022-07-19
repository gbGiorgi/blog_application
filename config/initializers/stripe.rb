
Rails.configuration.stripe = {
    :public_key => Rails.application.credentials.production[:stripe_public_key],
  
    :private_key => Rails.application.credentials.production[:stripe_private_key]
   }
   Stripe.api_key =  Rails.application.credentials.production[:stripe_private_key]