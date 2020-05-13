Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials.PUBLISHABLE_KEY,
  :secret_key      => Rails.application.credentials.SECRET_KEY
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]