class FetchNewAvailabilityJob < ApplicationJob
  queue_as :default

  def perform(availability_provider, domain_prioritizer)
    domain = domain_prioritizer.choose_domain

    if !domain.nil?
      available = availability_provider.check_availability domain.name
      save_availability domain, available
    end
  end

  def save_availability(domain, available)
    Availability.transaction do
      if domain.availability.nil?
        domain.create_availability(available: available)
      else
        domain.availability.available = available
        domain.availability.updated_at = Time.now
        domain.availability.save
      end
    end
  end
end
