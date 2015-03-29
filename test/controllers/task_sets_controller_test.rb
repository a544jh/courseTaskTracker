require 'test_helper'

class TaskSetsControllerTest < ActionController::TestCase
  setup do
    @task_set = task_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_set" do
    assert_difference('TaskSet.count') do
      post :create, task_set: { course_id: @task_set.course_id, name: @task_set.name }
    end

    assert_redirected_to task_set_path(assigns(:task_set))
  end

  test "should show task_set" do
    get :show, id: @task_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_set
    assert_response :success
  end

  test "should update task_set" do
    patch :update, id: @task_set, task_set: { course_id: @task_set.course_id, name: @task_set.name }
    assert_redirected_to task_set_path(assigns(:task_set))
  end

  test "should destroy task_set" do
    assert_difference('TaskSet.count', -1) do
      delete :destroy, id: @task_set
    end

    assert_redirected_to task_sets_path
  end
end
