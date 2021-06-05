require "test_helper"

class FetchNewAvailabilityJobTest < ActiveJob::TestCase
  test "it creates new availability entries" do
    tld = Tld.create(label: 'oo')
    domain = tld.domains.create(label: 'f')

    availability_provider = FixedAvailabilityProvider.new true
    domain_prioritizer = FixedDomainPrioritizer.new domain

    FetchNewAvailabilityJob.perform_now availability_provider, domain_prioritizer

    assert domain.availability.present?
    assert domain.availability.available
  end

  test "it updates existing availability entries" do
    tld = Tld.create(label: 'oo')
    domain = tld.domains.create(label: 'f')

    initial_time = Time.now - 2.hours
    domain.create_availability(available: false, created_at: initial_time, updated_at: initial_time)

    availability_provider = FixedAvailabilityProvider.new true
    domain_prioritizer = FixedDomainPrioritizer.new domain

    FetchNewAvailabilityJob.perform_now availability_provider, domain_prioritizer

    domain.reload
    assert domain.availability.available
  end

  test "it touches existing availability entries' updated_at even if nothing changed" do
    tld = Tld.create(label: 'oo')
    domain = tld.domains.create(label: 'f')

    initial_time = Time.now - 2.hours
    domain.create_availability(available: false, created_at: initial_time, updated_at: initial_time)

    availability_provider = FixedAvailabilityProvider.new false
    domain_prioritizer = FixedDomainPrioritizer.new domain

    FetchNewAvailabilityJob.perform_now availability_provider, domain_prioritizer

    domain.reload
    assert domain.availability.updated_at > initial_time
  end
end
