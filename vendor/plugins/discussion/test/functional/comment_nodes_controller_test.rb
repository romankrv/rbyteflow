require 'test_helper'

class CommentNodesControllerTest < ActionController::TestCase
  setup do
    @comment_node = comment_nodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_nodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_node" do
    assert_difference('CommentNode.count') do
      post :create, :comment_node => @comment_node.attributes
    end

    assert_redirected_to comment_node_path(assigns(:comment_node))
  end

  test "should show comment_node" do
    get :show, :id => @comment_node.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @comment_node.to_param
    assert_response :success
  end

  test "should update comment_node" do
    put :update, :id => @comment_node.to_param, :comment_node => @comment_node.attributes
    assert_redirected_to comment_node_path(assigns(:comment_node))
  end

  test "should destroy comment_node" do
    assert_difference('CommentNode.count', -1) do
      delete :destroy, :id => @comment_node.to_param
    end

    assert_redirected_to comment_nodes_path
  end
end
