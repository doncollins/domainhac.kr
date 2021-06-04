require "test_helper"

class EmptyDomainPrioritizerTest < ActiveSupport::TestCase
  test "it selects the provided domain" do
    prioritizer = EmptyDomainPrioritizer.new
    assert prioritizer.choose_domain.nil?
  end
end
