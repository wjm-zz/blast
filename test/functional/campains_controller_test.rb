require 'test_helper'

class CampainsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Campain.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Campain.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Campain.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to campain_url(assigns(:campain))
  end
  
  def test_edit
    get :edit, :id => Campain.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Campain.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Campain.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Campain.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Campain.first
    assert_redirected_to campain_url(assigns(:campain))
  end
  
  def test_destroy
    campain = Campain.first
    delete :destroy, :id => campain
    assert_redirected_to campains_url
    assert !Campain.exists?(campain.id)
  end
end
