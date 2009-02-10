# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.2.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'

  config.action_controller.session = {
    :session_key => '_kadumo_session',
    :secret      => '6e9b92d030ea9b8a55a0d993e9b723008a5cba18e171413f6dbd5ca1556916c7c1394f107270fe3ce02a5a05265e55f4779fe4466b13d52033b1f0436eaf224b'
  }
end