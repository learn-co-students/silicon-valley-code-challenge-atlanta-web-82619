class FundingRound

    attr_accessor :type, :investment
    attr_reader :startup, :enture_capitalist

    @@all = []

    def initialize(startup, investment, type, venture_capitalist)
        @startup = startup
        @investment = investment.to_f
        @venture_capitalist = venture_capitalist
        @type = type #FundingRound#type - examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
        @@all << self
    end

    def self.all
        @@all
    end
end
