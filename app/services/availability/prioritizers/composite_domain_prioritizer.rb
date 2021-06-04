class CompositeDomainPrioritizer
    def initialize(prioritizers)
        @prioritizers = prioritizers
    end

    def choose_domain
        @prioritizers.each do |prioritizer|
            domain = prioritizer.choose_domain
            return domain if domain
        end

        nil
    end
end