class VentureCapitalist
    attr_reader :name
    attr_accessor :net_worth
    @@all = []
    def initialize(name, net_worth = 1000000)
        @name = name
        @net_worth = net_worth
        @@all << self
    end

    def offer_contract(startup, investment, type)
        FundingRound.new(startup, self, investment, type)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map {|round| round.startup.name}.uniq
    end
    
    def biggest_investment
        self.funding_rounds.reduce{|big, i| big = i if i.investment > big.investment}
    end

    def invested(domain)
        FundingRound.all.select {|round| round.investment if round.startup.domain == domain}.reduce(0){|i, round| i + round.investment}
    end

    def self.all
        @@all
    end

end
