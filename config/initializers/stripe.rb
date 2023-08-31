# config/initializers/stripe.rb
Rails.configuration.stripe_secret_key = ENV['STRIPE_SECRET_KEY']
Rails.configuration.stripe_publishable_key = ENV['STRIPE_PUBLISHABLE_KEY']

Stripe.api_key = Rails.configuration.stripe_secret_key


