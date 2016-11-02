require 'test_helper'

class TimeStampsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_stamp = time_stamps(:one)
  end

  test "should get index" do
    get time_stamps_url, as: :json
    assert_response :success
  end

  test "should create time_stamp" do
    assert_difference('TimeStamp.count') do
      post time_stamps_url, params: { time_stamp: { signature: @time_stamp.signature } }, as: :json
    end

    assert_response 201
  end

  test "should show time_stamp" do
    get time_stamp_url(@time_stamp), as: :json
    assert_response :success
  end

  test "should update time_stamp" do
    patch time_stamp_url(@time_stamp), params: { time_stamp: { signature: @time_stamp.signature } }, as: :json
    assert_response 200
  end

  test "should destroy time_stamp" do
    assert_difference('TimeStamp.count', -1) do
      delete time_stamp_url(@time_stamp), as: :json
    end

    assert_response 204
  end
end
