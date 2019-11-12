require 'test_helper'

class OffensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offense = offenses(:one)
  end

  test "should get index" do
    get offenses_url, as: :json
    assert_response :success
  end

  test "should create offense" do
    assert_difference('Offense.count') do
      post offenses_url, params: { offense: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show offense" do
    get offense_url(@offense), as: :json
    assert_response :success
  end

  test "should update offense" do
    patch offense_url(@offense), params: { offense: {  } }, as: :json
    assert_response 200
  end

  test "should destroy offense" do
    assert_difference('Offense.count', -1) do
      delete offense_url(@offense), as: :json
    end

    assert_response 204
  end
end
