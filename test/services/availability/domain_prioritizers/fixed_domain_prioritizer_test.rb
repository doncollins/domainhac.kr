require "test_helper"

class FixedDomainPrioritizerTest < ActiveSupport::TestCase
  test "it selects the provided domain" do
    tld = Tld.create label: 'com'
    domain = tld.domains.create label: 'foo'

    prioritizer = FixedDomainPrioritizer.new domain
    assert prioritizer.choose_domain == domain
  end
end
