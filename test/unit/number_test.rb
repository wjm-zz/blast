require 'test_helper'

class NumberTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Number.new.valid?
  end
end
