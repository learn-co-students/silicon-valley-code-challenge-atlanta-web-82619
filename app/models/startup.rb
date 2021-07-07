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

    def self.find_by_founder(founder)
        self.all.select { |startup| startup.founder == founder }
    end

    def self.domains
        domains = []
        self.all.each do |startup|
            domains << startup.domain
        end
        domains
    end

    def pivot(name, domain)
        self.name = name
        self.domain = domain
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select { |fr| fr.startup == self }.count
    end

    def total_funds
        funds = []
        FundingRound.all.select { |fr| funds << fr.investment if fr.startup == self }
        funds.inject(0){ |sum, x| sum + x }
    end

    def investors
        investors = []
        FundingRound.all.select { |fr| investors << fr.venture_capitalist if fr.startup == self }
        investors
    end

    def big_investors
        the_big_guys = []
        #investors.select { |i| the_big_guys << i if i.total_worth > 999999999 } (nope - I want a single source of truth!)
        investors.select { |i| the_big_guys << i if VentureCapitalist.tres_commas_club.include? i }
        the_big_guys
    end
end
