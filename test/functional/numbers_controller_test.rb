require 'test_helper'

class NumbersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Number.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Number.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Number.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to number_url(assigns(:number))
  end
  
  def test_edit
    get :edit, :id => Number.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Number.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Number.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Number.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Number.first
    assert_redirected_to number_url(assigns(:number))
  end
  
  def test_destroy
    number = Number.first
    delete :destroy, :id => number
    assert_redirected_to numbers_url
    assert !Number.exists?(number.id)
  end
end
