module RailsBrowscap
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      included do
        helper_method :current_browser
      end

      def current_browser
        @current_browser ||= RailsBrowscap.query(request.user_agent)
      end
    end
  end
end