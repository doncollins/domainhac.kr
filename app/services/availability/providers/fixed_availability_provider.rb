class FixedAvailabilityProvider
    def initialize(available)
        @available = available
    end

    def check_availability(domain_name)
        @available
    end
end