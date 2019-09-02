class VentureCapitalist

  attr_reader :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth

    @@all << self
  end

  def self.all
    @@all
  end

  ##

  def self.tres_commas_club
    billion = []
    VentureCapitalist.all.map do | person |
      if person.total_worth >= 1000000000
        billion << person.name
      end
    end
    billion
  end

  ##

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { | investment | investment.venture_capitalist == self }
  end

  def portfolio
    self.funding_rounds.map { | investment | investment.startup }.uniq
  end

  def biggest_investment
    self.funding_rounds.map { | investment | investment.investment }.max
  end

  def invested(str)
    total = []
    self.funding_rounds.select do |x|
      if x.startup.domain == str
        total << x.investment
      end
    end
    total.sum
  end

end
