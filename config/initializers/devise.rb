Devise.setup do |config|
  config.mailer_sender = 'Demo Simplicio <no-reply@simplicio.com>'

  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  require 'omniauth-google-oauth2'
  config.omniauth :google_oauth2, ENV['GOOGLE_API_ID'], ENV['GOOGLE_API_SECRET'], {access_type: "offline", approval_prompt:"" }

  require 'omniauth-facebook'
  config.omniauth :facebook, ENV['FACEBOOK_API_ID'], ENV['FACEBOOK_API_SECRET']

  require 'omniauth-github'
  config.omniauth :github, ENV['GITHUB_API_ID'], ENV['GITHUB_API_SECRET'], scope: "user:email"
end
