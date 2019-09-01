class VentureCapitalist
  attr_reader :name
  attr_accessor :total_worth

  @@all = []
  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth.to_f
    @@all << self
  end

  def offer_contract(startup, type, investment)
    contract = FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}  
  end

  def portfolio
    funding_rounds.map {|funding_round| funding_round.startup}.uniq
  end

  def biggest_investment
    funding_rounds.max_by {|f| f.investment}
  end

  def startups
    portfolio.map {|f| f.startup}.map {|s| s.domain}
  end

  
  def invested(domain)
    #from all funding_rounds, get all where startup.domain matches given domain, then get investment, then sum
    funding_rounds.select {|f| f.startup.domain == domain}.map {|f| f.investment}.sum
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    big_bucks = @@all.select {|x| x.total_worth > 1000000 }
  end

end
