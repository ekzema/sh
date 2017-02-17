# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {

    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "baci.lindsaar.net",
    :enable_starttls_auto => true,
    :authentication => :login,
    :user_name => "xxx.ukrain@gmail.com",
    :password => "Am2w3p4A"
}