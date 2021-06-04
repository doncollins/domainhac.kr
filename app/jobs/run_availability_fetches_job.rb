class RunAvailabilityFetchesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    start_time = Time.now

    provider = GandiAvailabilityProvider.new ENV['GANDI_KEY']

    prioritizer = CompositeDomainPrioritizer.new [
      MissingCheckDomainPrioritizer.new,
      OldestCheckDomainPrioritizer.new
    ]

    while Time.now - start_time < 60 - provider.interval do
      FetchNewAvailabilityJob.perform_now provider, prioritizer
      sleep provider.interval
    end
  end
end
