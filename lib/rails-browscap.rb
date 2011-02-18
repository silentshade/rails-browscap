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
  def self.query(user_agent)
    @@browscap.query(user_agent)
  end
end
ActionController::Base.send :include, RailsBrowscap::Controllers::Helpers

