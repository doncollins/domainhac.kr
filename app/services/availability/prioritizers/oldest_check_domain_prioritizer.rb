class OldestCheckDomainPrioritizer
    def choose_domain
        Domain.joins(:availability).order('availabilities.updated_at').first
    end
end