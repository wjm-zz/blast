require 'test_helper'

class AttachmentsControllerTest < ActionController::TestCase
  def test_show
    get :show, :id => Attachment.first
    assert_template 'show'
  end
  
  def test_create_invalid
    Attachment.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Attachment.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to attachment_url(assigns(:attachment))
  end
end
