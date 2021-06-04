require "test_helper"

class MissingCheckDomainPrioritizerTest < ActiveSupport::TestCase
  test "it selects a domain without any availability check" do
    tld = Tld.create label: 'com'
    domain1 = tld.domains.create label: 'foo'
    domain2 = tld.domains.create label: 'bar'
    domain3 = tld.domains.create label: 'baz'

    domain1.create_availability available: true
    domain3.create_availability available: true

    prioritizer = MissingCheckDomainPrioritizer.new
    assert prioritizer.choose_domain == domain2
  end
end
