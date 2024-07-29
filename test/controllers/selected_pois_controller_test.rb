require "test_helper"

class SelectedPoisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @selected_poi = selected_pois(:one)
  end

  test "should get index" do
    get selected_pois_url, as: :json
    assert_response :success
  end

  test "should create selected_poi" do
    assert_difference("SelectedPoi.count") do
      post selected_pois_url, params: { selected_poi: { day: @selected_poi.day, poi: @selected_poi.poi, trip_id: @selected_poi.trip_id } }, as: :json
    end

    assert_response :created
  end

  test "should show selected_poi" do
    get selected_poi_url(@selected_poi), as: :json
    assert_response :success
  end

  test "should update selected_poi" do
    patch selected_poi_url(@selected_poi), params: { selected_poi: { day: @selected_poi.day, poi: @selected_poi.poi, trip_id: @selected_poi.trip_id } }, as: :json
    assert_response :success
  end

  test "should destroy selected_poi" do
    assert_difference("SelectedPoi.count", -1) do
      delete selected_poi_url(@selected_poi), as: :json
    end

    assert_response :no_content
  end
end
