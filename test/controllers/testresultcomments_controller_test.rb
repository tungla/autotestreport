require 'test_helper'

class TestresultcommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testresultcomment = testresultcomments(:one)
  end

  test "should get index" do
    get testresultcomments_url
    assert_response :success
  end

  test "should get new" do
    get new_testresultcomment_url
    assert_response :success
  end

  test "should create testresultcomment" do
    assert_difference('Testresultcomment.count') do
      post testresultcomments_url, params: { testresultcomment: {  } }
    end

    assert_redirected_to testresultcomment_url(Testresultcomment.last)
  end

  test "should show testresultcomment" do
    get testresultcomment_url(@testresultcomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_testresultcomment_url(@testresultcomment)
    assert_response :success
  end

  test "should update testresultcomment" do
    patch testresultcomment_url(@testresultcomment), params: { testresultcomment: {  } }
    assert_redirected_to testresultcomment_url(@testresultcomment)
  end

  test "should destroy testresultcomment" do
    assert_difference('Testresultcomment.count', -1) do
      delete testresultcomment_url(@testresultcomment)
    end

    assert_redirected_to testresultcomments_url
  end
end
