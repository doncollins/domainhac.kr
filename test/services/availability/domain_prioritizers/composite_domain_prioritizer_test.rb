require "test_helper"

class CompositeDomainPrioritizerTest < ActiveSupport::TestCase
  test "it selects the first non-nil prioritizer result" do
    tld = Tld.create label: 'com'
    domain1 = tld.domains.create label: 'foo'
    domain2 = tld.domains.create label: 'bar'

    prioritizer = CompositeDomainPrioritizer.new [
        EmptyDomainPrioritizer.new,
        FixedDomainPrioritizer.new(domain1),
        FixedDomainPrioritizer.new(domain2)
    ]

    assert prioritizer.choose_domain == domain1
  end
end
