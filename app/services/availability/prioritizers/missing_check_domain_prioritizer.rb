class MissingCheckDomainPrioritizer
    def choose_domain
        Domain.includes(:availability, :phrases)
            .where(availability: { domain_id: nil })
            .order('phrases.score desc')
            .first
    end
end