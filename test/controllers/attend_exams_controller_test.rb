require 'test_helper'

class AttendExamsControllerTest < ActionController::TestCase
  test "should get attendexam" do
    get :attendexam
    assert_response :success
  end

  test "should get completeexam" do
    get :completeexam
    assert_response :success
  end

  test "should get onlineusers" do
    get :onlineusers
    assert_response :success
  end

end
