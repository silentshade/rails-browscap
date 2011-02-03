# desc "Explaining what the task does"
# task :browscap do
#   # Task goes here
# end

namespace :browscap do

  require 'net/http'
  
  desc "Update browscap file"
  task :update => :environment do
    Net::HTTP.start("browsers.garykeith.com") { |http|
      resp = http.get("/stream.asp?BrowsCapINI", {'User-Agent' => 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9'})
      open("#{Rails.root}/config/browscap.ini", "w") { |file|
        file.write(resp.body)
      }
    }
  end

end