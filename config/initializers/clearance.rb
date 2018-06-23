Clearance.configure do |config|
  config.mailer_sender = "localhost:3000"
  config.rotate_csrf_on_sign_in = true
  config.routes = false
  config.allow_sign_up = false
  config.httponly = false
  config.redirect_url = '/admin'
  config.sign_in_guards = []
end
