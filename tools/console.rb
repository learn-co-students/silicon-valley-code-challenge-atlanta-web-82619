require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

apple = Startup.new("Apple", "Steve Jobs", "apple.com")
google = Startup.new("Google", "Matt Damon", "google.com")
kickstarter = Startup.new("Kickstarter", "Ben Affleck", "kickstarter.com")

mark = VentureCapitalist.new("Mark", 563570)
alex = VentureCapitalist.new("Alex", 1000)
tim = VentureCapitalist.new("Tim", 999999999999)

round1 = FundingRound.new(apple, mark, "type", 1000)
round2 = FundingRound.new(google, alex, "type", 5000.134)
round3 = FundingRound.new(apple, tim, "type", 235643.654)
round4 = FundingRound.new(apple, mark, "type", 696969)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
