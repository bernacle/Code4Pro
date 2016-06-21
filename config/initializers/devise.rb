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
  config.omniauth :google_oauth2, '674124018100-hum9b1lkvbl23i5n3skj2m2e0msifa87.apps.googleusercontent.com', 'xRCKw48JFmRRl5s5_8YFLepS', {access_type: "offline", approval_prompt:"" }

  require 'omniauth-facebook'
  config.omniauth :facebook, '507449456124337', '25aa1e111a18236b680cdbfb877a881b'

  require 'omniauth-github'
  config.omniauth :github, '90ca6a79fd37c836409b', '7ab1beca9342cd9fee5767e6956c8664112ee4cb', scope: "user:email"
end
