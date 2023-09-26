# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
require_relative './environment'
  set :output, './log/cron.log'
#  every 1.minutes do
#     set :environment, :development
#     env :PATH, ENV['PATH']
#   runner 'puts Time.now'
#   runner 'puts Rails.env'
#   runner 'Discount.scheduled_discount'
#  end


def timezoned time
  Time.zone.parse(time).utc
end
 every 1.minutes do
    set :environment, :development
    env :PATH, ENV['PATH']
  runner 'puts Time.now'
  runner 'puts Rails.env'
 
 end

 every 1.minutes, at: '01:32pm', by_timezone: 'London' do
  set :environment, :development
  env :PATH, ENV['PATH']
runner 'puts Time.now'
runner 'puts Rails.env'
runner 'puts "thhis is england"'

end
every 1.hours, by_timezone: 'Moscow' do
  set :environment, :development
  env :PATH, ENV['PATH']
runner 'puts Time.now'
runner 'puts Rails.env'
runner 'puts "thhis is moscow"'
end
every 1.day, at: timezoned('6:29 am') do
  set :environment, :development
  env :PATH, ENV['PATH']
  runner 'puts Time.now'
  runner 'puts Rails.env'
  runner 'puts "this is aditya1"'
end



# Learn more: http://github.com/javan/whenever
