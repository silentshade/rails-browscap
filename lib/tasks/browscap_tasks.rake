# desc "Explaining what the task does"
# task :browscap do
#   # Task goes here
# end

namespace :browscap do

  require 'net/http'
  
  desc "Update browscap file"
  task :update do
    Net::HTTP.start("browsers.garykeith.com") { |http|
      resp = http.get("/stream.asp?BrowsCapINI")
      open("#{RAILS_ROOT}/config/browscap.ini", "w") { |file|
        file.write(resp.body)
      }
    }
  end

end