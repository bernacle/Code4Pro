Rails.configuration.stripe = {
  :publishable_key => 'pk_test_wDrrgBsbN6xEspYBXHJ8CBXy',
  :secret_key      => 'sk_test_Nq1W8m8UigHwDIROe1bCwcP9'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
