require 'rails/generators'

module RailsBrowscap
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc 'install browscap'

      def install

        #downlad browscap.ini

        Net::HTTP.start("browsers.garykeith.com") { |http|
          resp = http.get("/stream.asp?BrowsCapINI", {'User-Agent' => 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9'})
          create_file("config/browscap.ini", resp.body)
        }

        #initialize
        copy_file "browscap.rb", "config/initializers/browscap.rb"
      end

    end
  end
end