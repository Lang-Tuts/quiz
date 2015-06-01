require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get allocate_to_exam" do
    get :allocate_to_exam
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
