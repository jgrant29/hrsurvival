require 'test_helper'

class TableofcontentsControllerTest < ActionController::TestCase
  setup do
    @tableofcontent = tableofcontents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tableofcontents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tableofcontent" do
    assert_difference('Tableofcontent.count') do
      post :create, tableofcontent: { author: @tableofcontent.author, body: @tableofcontent.body, description: @tableofcontent.description, public: @tableofcontent.public, title: @tableofcontent.title }
    end

    assert_redirected_to tableofcontent_path(assigns(:tableofcontent))
  end

  test "should show tableofcontent" do
    get :show, id: @tableofcontent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tableofcontent
    assert_response :success
  end

  test "should update tableofcontent" do
    patch :update, id: @tableofcontent, tableofcontent: { author: @tableofcontent.author, body: @tableofcontent.body, description: @tableofcontent.description, public: @tableofcontent.public, title: @tableofcontent.title }
    assert_redirected_to tableofcontent_path(assigns(:tableofcontent))
  end

  test "should destroy tableofcontent" do
    assert_difference('Tableofcontent.count', -1) do
      delete :destroy, id: @tableofcontent
    end

    assert_redirected_to tableofcontents_path
  end
end
