require 'test_helper'

class WidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @widget = widgets(:one)
  end

  test "should get index" do
    get v1_widgets_url
    assert_response :success
  end

  test "should get new" do
    get new_v1_widget_url
    assert_response :success
  end

  test "should create widget" do
    assert_difference('Widget.count') do
      post v1_widgets_url, params: { widget: { description: @widget.description, name: @widget.name, price_cents: @widget.price_cents, upc: "666" } }
    end

    assert_redirected_to v1_widget_url(Widget.last)
  end

  test "should show widget" do
    get v1_widget_url(@widget)
    assert_response :success
  end

  test "should get edit" do
    get edit_v1_widget_url(@widget)
    assert_response :success
  end

  test "should update widget" do
    patch v1_widget_url(@widget), params: { widget: { description: @widget.description, name: @widget.name, price_cents: @widget.price_cents, upc: @widget.upc } }
    assert_redirected_to v1_widget_url(@widget)
  end

  test "should destroy widget" do
    assert_difference('Widget.count', -1) do
      delete v1_widget_url(@widget)
    end

    assert_redirected_to v1_widgets_url
  end
end
