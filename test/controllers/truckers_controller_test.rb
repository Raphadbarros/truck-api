require 'test_helper'

class TruckersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trucker = truckers(:one)
  end

  test "should get index" do
    get truckers_url
    assert_response :success
  end

  test "should get new" do
    get new_trucker_url
    assert_response :success
  end

  test "should create trucker" do
    assert_difference('Trucker.count') do
      post truckers_url, params: { trucker: { name: @trucker.name, phone: @trucker.phone } }
    end

    assert_redirected_to trucker_url(Trucker.last)
  end

  test "should show trucker" do
    get trucker_url(@trucker)
    assert_response :success
  end

  test "should get edit" do
    get edit_trucker_url(@trucker)
    assert_response :success
  end

  test "should update trucker" do
    patch trucker_url(@trucker), params: { trucker: { name: @trucker.name, phone: @trucker.phone } }
    assert_redirected_to trucker_url(@trucker)
  end

  test "should destroy trucker" do
    assert_difference('Trucker.count', -1) do
      delete trucker_url(@trucker)
    end

    assert_redirected_to truckers_url
  end
end
