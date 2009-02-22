RAILS_GEM_VERSION = '2.2.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = 'UTC'

  config.action_controller.session = {
    :session_key => '_blast_session',
    :secret      => '1b2a0f31a4111d59225d75a9a612382228518e6d1ddb5871af2813c2d24bcead70c7377cd70acd7521473eaeb08fe2103c5528cf5fcf44a85c8ea6d12ea58da9'
  }

end
require "will_paginate" 
