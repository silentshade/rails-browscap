module RailsBrowscap
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      included do
        #make it available as a helper
        helper_method :current_browser
      end

      # Get the current browser
      # @return [Browser] the current browser object
      def current_browser
        @current_browser ||= RailsBrowscap.query(request.user_agent)
      end
    end
  end
end