require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

s1 = Startup.new("Apple", "Steve Jobs", "www.apple.com")
s2 = Startup.new("Facebook", "Mark Z", "www.facebook.com")

vc1 = VentureCapitalist.new("Mark", 1000000000)
vc2 = VentureCapitalist.new("Timothy", 550250000)
vc3 = VentureCapitalist.new("Alex", 6000000000)
vc4 = VentureCapitalist.new("Danny", 99999999999999)

fr1 = FundingRound.new(s1, vc1, "Angel", 50000000)
fr2 = FundingRound.new(s2, vc1, "Angel", 15000000)
fr5 = FundingRound.new(s2, vc1, "Round2", 5000)

fr3 = FundingRound.new(s2, vc2, "Angel", 250000)

fr4 = FundingRound.new(s2, vc3, "Angel", 100000000)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line