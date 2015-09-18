set :environment, "production"
set :output, {:error => "log/cron_error.log", :standard => "log/cron.log"}

every 2.day, :at => '5:10 am' do
  rake "-s sitemap:refresh"
end