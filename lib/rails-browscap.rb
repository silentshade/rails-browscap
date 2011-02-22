require 'inifile'
require 'browscap'

require 'rails'
require 'action_controller'

require 'rails-browscap/controllers/helpers'

#force ISO-8859-1 until browscap updates
require 'browscap_compat'

module RailsBrowscap
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/rails-browscap_tasks.rake"
    end
  end
end

module RailsBrowscap
  # Query the browscap DB
  # @param [String] User agent string
  def self.query(user_agent)
    #setup in the initializer
    @@browscap.query(user_agent)
  end
end
ActionController::Base.send :include, RailsBrowscap::Controllers::Helpers
