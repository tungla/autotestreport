require 'test_helper'

class TestresultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testresult = testresults(:one)
  end

  test "should get index" do
    get testresults_url
    assert_response :success
  end

  test "should get new" do
    get new_testresult_url
    assert_response :success
  end

  test "should create testresult" do
    assert_difference('Testresult.count') do
      post testresults_url, params: { testresult: { duration: @testresult.duration, environment: @testresult.environment, error_msg: @testresult.error_msg, feature_name: @testresult.feature_name, test_case_name: @testresult.test_case_name, test_result: @testresult.test_result } }
    end

    assert_redirected_to testresult_url(Testresult.last)
  end

  test "should show testresult" do
    get testresult_url(@testresult)
    assert_response :success
  end

  test "should get edit" do
    get edit_testresult_url(@testresult)
    assert_response :success
  end

  test "should update testresult" do
    patch testresult_url(@testresult), params: { testresult: { duration: @testresult.duration, environment: @testresult.environment, error_msg: @testresult.error_msg, feature_name: @testresult.feature_name, test_case_name: @testresult.test_case_name, test_result: @testresult.test_result } }
    assert_redirected_to testresult_url(@testresult)
  end

  test "should destroy testresult" do
    assert_difference('Testresult.count', -1) do
      delete testresult_url(@testresult)
    end

    assert_redirected_to testresults_url
  end
end
