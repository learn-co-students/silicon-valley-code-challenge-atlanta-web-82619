require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

uber = Startup.new("Uber", "Travis Kalanick", "transportation")
lyft = Startup.new("Lyft", "Logan Green", "transportation")
airbnb = Startup.new("AirBnB", "Brian Chesky", "travel")
twitter = Startup.new("Twitter", "Jack Dorsey", "social media")
snapchat = Startup.new("Snapchat", "Evan Spiegel", "social media")
stripe = Startup.new("Stripe", "Patrick Collison", "finance")
braintree = Startup.new("Braintree", "Bryan Johnson", "finance")
zillow = Startup.new("Zillow", "Richard Barton", "real estate")
grubhub = Startup.new("Grubhub", "Matt Maloney", "food")

billGurley = VentureCapitalist.new("Bill Gurley", 98000000) 
chrisSacca  = VentureCapitalist.new("Chris Sacca", 1700000)
jeffJordan  = VentureCapitalist.new("Jeff Jordan", 850000)
alfredLin  = VentureCapitalist.new("Alfred Lin", 250000)
raviMhatre  = VentureCapitalist.new("Ravi Mhatre", 15000000)
joshKopelman  = VentureCapitalist.new("Josh Kopelman", 37000000)
peterFenton  = VentureCapitalist.new("Peter Fenton", 30600000)
maryMeeker  = VentureCapitalist.new("Mary Meeker", 975000)
kirstenGreen  = VentureCapitalist.new("Kirsten Green", 25000000)
jennyLee  = VentureCapitalist.new("Jenny Lee", 57000000)

contract1 = FundingRound.new(uber, billGurley, "Series A", 50000.0)
contract2 = FundingRound.new(twitter, alfredLin, "Angel", 10000)
uber.sign_contract(peterFenton, "Series A", 5000)
uber.sign_contract(alfredLin, "Seed", 1000)
peterFenton.offer_contract(uber, "Seed", 15000)
maryMeeker.offer_contract(stripe, "Pre-Seed", 20000)
alfredLin.offer_contract(snapchat, "Seed", 5000)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line