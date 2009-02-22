require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Attachment.new.valid?
  end
end
