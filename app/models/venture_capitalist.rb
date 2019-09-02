require 'pry'
class VentureCapitalist
    attr_accessor :total_worth
    attr_reader :name
    @@all = []
    @@tres_commas_club = []


    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth.to_f.round(2)
        @@all << self
        if self.total_worth > 999999999
            @@tres_commas_club << self
        end
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@tres_commas_club
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds 
        FundingRound.all.select { |fr| fr.venture_capitalist == self }
    end

    def portfolio
        self.funding_rounds.map { |fr| fr.startup }.uniq
    end

    def biggest_investment
        self.funding_rounds.max { |fr1, fr2| fr1.investment <=> fr2.investment }
    end

    def invested(domain)
        total = []
        self.funding_rounds.select do |fr|
            if fr.startup.domain == domain
                total << fr.investment
            end
        end
        total.inject(0){ |sum, x| sum + x }
    end
end
