ActionMailer::Base.smtp_settings = {
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => "plain",
   :enable_starttls_auto => true,
   :user_name => "ns027.rortesting@gmail.com",
   :password => "nikhil117",
   :openssl_verify_mode  => 'none'
}