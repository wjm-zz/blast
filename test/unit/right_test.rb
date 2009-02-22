require 'test_helper'

class RightTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Right.new.valid?
  end
end
