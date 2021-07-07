class FundingRound
    attr_accessor :type
    attr_reader :startup, :venture_capitalist, :investment
    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment.to_f.round(2)
        @@all << self
    end

    def self.all
        @@all
    end
end
