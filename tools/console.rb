require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

start1 = Startup.new("Nick's Business", "Nick", "nicksbusiness.com")
start2 = Startup.new("Flatiron School", "Avi", "flatironschool.com")
start3 = Startup.new("Nick's New Business", "Nick", "nicksnewbiz.org")
start4 = Startup.new("Sallie Mae", "Sallie", "salliemae.com")

warren = VentureCapitalist.new("Warren Buffet", 210239123102339)
bobby = VentureCapitalist.new("Bobby Bouchet", 1000)
bill = VentureCapitalist.new("Bill Gates", 2042304982304)
nick = VentureCapitalist.new("Nick Lunn", 234234)
sam = VentureCapitalist.new("Uncle Sam", 1000000000000000000000000000)

r1 = FundingRound.new(start1, warren, 900000, "Series B")
r2 = FundingRound.new(start1, bill, 2000)
r3 = FundingRound.new(start2, warren, 30000000)
r4 = FundingRound.new(start2, bill, 100000000)
r5 = FundingRound.new(start3, bobby, 950)
r6 = FundingRound.new(start1, nick, 19399)
r7 = FundingRound.new(start1, sam, 1000000000000)
r8 = FundingRound.new(start1, bobby, 50)


start1.sign_contract(bill, 12901239, "Series A") 
start4.sign_contract(sam, 4923942042402904, "Bailout")

sam.offer_contract(start4, 10000000000000000000, "Bailout")


binding.pry
0 #leave this here to ensure binding.pry isn't the last line