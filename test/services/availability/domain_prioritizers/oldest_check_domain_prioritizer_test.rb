require "test_helper"

class OldestCheckDomainPrioritizerTest < ActiveSupport::TestCase
  test "it selects the domain with the oldest availability check" do
    tld = Tld.create label: 'com'
    domain1 = tld.domains.create label: 'foo'
    domain2 = tld.domains.create label: 'bar'
    domain3 = tld.domains.create label: 'baz'

    domain1.create_availability available: true, updated_at: Time.now - 1.minutes
    domain2.create_availability available: true, updated_at: Time.now - 3.minutes
    domain3.create_availability available: true, updated_at: Time.now - 2.minutes

    prioritizer = OldestCheckDomainPrioritizer.new
    assert prioritizer.choose_domain == domain2
  end
end
