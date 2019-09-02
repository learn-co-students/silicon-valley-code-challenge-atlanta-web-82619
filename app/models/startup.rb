class Startup

    attr_accessor :name, :founder
    attr_reader :domain

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

    def pivot(name, domain)
        self.name = name
        self.domain = domain
    end

    def self.find_by_founder(founder)
        #given a string of a founder's name, returns the first startup whose founder's name matches
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        self.all.map {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        #given a venture capitalist object, type of investment (as a string), 
        #and the amount invested (as a float), creates a new funding round 
        #and associates it with that startup and venture capitalist.
        funding_round = FundingRound.new(self, investment, venture_capitalist)
        funding_round.type = type
        funding_round
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.startup == self}
    end

    def num_funding_rounds
        self.funding_rounds.size
    end

    def total_funds
        all_startup_rounds = FundingRound.all.select {|round| round.startup == self}
        all_startup_rounds.reduce {|total, round| total += round.investment}
    end
    
    #OR: 
    #def total_funds
    #   funding_rounds.map {|funding_round| funding_round.investment}.sum
    #end

    def investors
        investors = []
        FundingRound.all.each do |round|
            if round.startup == self
                investors << round.venture_capitalist
            end
        end
        investors.uniq
    end

    #OR:
    #def investors
    #    funding_rounds.map {|funding_round| funding_round.venture_capitalist}.uniq
    #end

    def big_investors
        big_investors = []
        FundingRound.all.each do |round|
            if round.startup == self && round.venture_capitalist.tres_commas_club
                big_investors << round.venture_capitalist
            end
        end
        big_investors
    end

    #OR:
    #def big_investors
    #    investors.select {|investor| investor.total_worth > 1000000}
    #end
end
