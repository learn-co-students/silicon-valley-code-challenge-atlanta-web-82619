class FundingRound
  attr_reader :startup, :venture_capitalist, :investment
  attr_accessor :type

  @@all = []
  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment.to_f
    @@all << self
  end

  #TODO how to block contract if investment not float or positive?
  def investment=(investment)
    if investment.positive? && investment.class == Float
      @investment = investment
    end
  end

  def self.all
    @@all
  end
end
