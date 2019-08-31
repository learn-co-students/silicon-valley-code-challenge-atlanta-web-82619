class Startup
    attr_accessor :name
    attr_reader :founder , :domain
    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
    def pivot(name, domain)
        @name = name
        @domain = domain
    end
    def self.all
        @@all
    end
    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == found}
    end

    def self.domains
        self.all.map {|startup| startup.domain}
    end

    def sign_contract(venture_cap, investment, type)
        FundingRound.new(self, venture_cap, investment.to_f, type)
    end

    def num_funding_rounds
        FundingRound.all.select {|round| round.startup == self}.length
    end

    def total_funds
        FundingRound.all.inject(0){|total, n| total + n.investment}
    end

    def venturers
        FundingRound.all.map {|round| round.venture_capitalist if round.startup == self}.compact
    end

    def investors
        self.venturers.map {|v| v.name}.uniq
    end

    def big_investors
        big = self.venturers.select {|v| v.net_worth > 999999999}
        big.map {|v| v.name}.uniq
    end

end
