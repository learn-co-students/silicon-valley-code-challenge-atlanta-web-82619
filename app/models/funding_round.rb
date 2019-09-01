class FundingRound
    attr_reader  :startup , :venture_capitalist , :type , :investment
    @@all = []
    def initialize(startup, venture_cap, investment, type = "Angel")
        @startup = startup
        @venture_capitalist = venture_cap
        @investment = investment.to_f
        @type = type
        @@all << self
    end


    def self.all
        @@all
    end
end
