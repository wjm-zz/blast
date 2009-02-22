require 'test_helper'

class RightsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Right.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Right.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Right.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to right_url(assigns(:right))
  end
  
  def test_edit
    get :edit, :id => Right.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Right.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Right.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Right.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Right.first
    assert_redirected_to right_url(assigns(:right))
  end
  
  def test_destroy
    right = Right.first
    delete :destroy, :id => right
    assert_redirected_to rights_url
    assert !Right.exists?(right.id)
  end
end
