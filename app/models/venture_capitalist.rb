class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth.to_f
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|member| member.total_worth > 1,000,000,000}
    end

    def offer_contract(startup, type, investment)
        round = FundingRound.new(startup, investment, type, self)
        round
    end
    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end
    
    def portfolio
        portfolio = []
        FundingRound.all.each do |round|
            if round.venture_capitalist == self
                portfolio << round.startup
            end
        end
        portfolio.uniq
    end

    #OR:
    #def portfolio
    #    funding_rounds.map {|funding_round| funding_round.startup}.uniq
    #end
    
    def biggest_investment
        largest_investment = 0
        largest_round = nil
        self.funding_rounds.each do |round|
            if round.investment > largest_investment
                largest_investment = round.investment
                largest_round = round
            end
        end
        largest_round
    end

    #OR:
    #def biggest_investment
    #    funding_rounds.max_by {|round| round.investment}
    #end
    
    def invested(domain)
        #given a domain string, returns the total amount invested in that domain
        total = 0
        portfolio.each do |round|
            if round.startup.domain == domain
                total += round.investment.to_f
            end
        end
        total
    end

    #OR:
    #def invested(domain)
    #    funding_rounds.select {|f| f.startup.domain == domain}.map {|f| f.investment}.sum
    #end
end
