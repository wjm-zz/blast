require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Campaign.new.valid?
  end
end
