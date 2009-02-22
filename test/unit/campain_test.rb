require 'test_helper'

class CampainTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Campain.new.valid?
  end
end
