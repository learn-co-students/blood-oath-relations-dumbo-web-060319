require_relative '../config/environment.rb'
require "date"
def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

league = Cult.new("league-cult")
dota = Cult.new("dota-cult")

brandon = Follower.new("brandon",19)
grace = Follower.new("grace",32)
tony = Follower.new("Tony",21)
jonathan = Follower.new("Jonathan",25)

brandon.join_cult(league)
grace.join_cult(league)

dota.recruit_follower(tony)
dota.recruit_follower(jonathan)


binding.pry
puts "Mwahahaha!" # just in case pry is buggy and exits
