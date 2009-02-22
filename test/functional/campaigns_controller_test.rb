require 'test_helper'

class CampaignsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Campaign.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Campaign.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Campaign.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to campaign_url(assigns(:campaign))
  end
  
  def test_edit
    get :edit, :id => Campaign.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Campaign.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Campaign.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Campaign.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Campaign.first
    assert_redirected_to campaign_url(assigns(:campaign))
  end
  
  def test_destroy
    campaign = Campaign.first
    delete :destroy, :id => campaign
    assert_redirected_to campaigns_url
    assert !Campaign.exists?(campaign.id)
  end
end
