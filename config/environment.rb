# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'yaml'

# Initialize the Rails application.
Rails.application.initialize!

# Configure SMTP settings
smtp_settings = YAML.load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'smtp.yml'))
ActionMailer::Base.smtp_settings = {
  address: smtp_settings['address'],
  port: '587',
  authentication: :plain,
  user_name: smtp_settings['username'],
  password: smtp_settings['password'],
  domain: smtp_settings['domain'],
  enable_starttls_auto: true
}
