# frozen_string_literal: true

require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select "nav a", minimum: 4
    assert_select "main ul li", 5
    assert_select "h2", "Captain Blood"
    assert_select "h2", "The Count Monte Cristo"
    assert_select "h2", "Disgardium Class-A Threat"
  end
end
