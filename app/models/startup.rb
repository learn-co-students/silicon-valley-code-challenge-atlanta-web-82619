class Startup

  attr_accessor :name, :domain
  attr_reader :founder
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def self.all
    @@all
  end

  ###

  def pivot(name, domain)
    self.name = name
    self.domain = domain
  end

  def self.find_by_founder(str)
    Startup.all.find { | company | company.founder == str }
  end

  def self.domains
    Startup.all.map do | company |
      company.name
    end
  end

  ##

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    FundingRound.all.select { | round | round.startup == self }.count
  end

  def total_funds
    total = []
    FundingRound.all.select { | round | total << round.investment if round.startup == self }
    total.sum
  end

  def investors
    arr = []
    FundingRound.all.select { | round | arr << round.venture_capitalist.name if round.startup == self }
    arr
  end

  def big_investors
    arr = []
    investors.select { | investor | arr << investor if VentureCapitalist.tres_commas_club.include? investor}
  end

end
