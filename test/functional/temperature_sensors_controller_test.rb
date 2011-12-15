require 'test_helper'

class TemperatureSensorsControllerTest < ActionController::TestCase
  setup do
    @temperature_sensor = temperature_sensors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:temperature_sensors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create temperature_sensor" do
    assert_difference('TemperatureSensor.count') do
      post :create, :temperature_sensor => @temperature_sensor.attributes
    end

    assert_redirected_to temperature_sensor_path(assigns(:temperature_sensor))
  end

  test "should show temperature_sensor" do
    get :show, :id => @temperature_sensor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @temperature_sensor.to_param
    assert_response :success
  end

  test "should update temperature_sensor" do
    put :update, :id => @temperature_sensor.to_param, :temperature_sensor => @temperature_sensor.attributes
    assert_redirected_to temperature_sensor_path(assigns(:temperature_sensor))
  end

  test "should destroy temperature_sensor" do
    assert_difference('TemperatureSensor.count', -1) do
      delete :destroy, :id => @temperature_sensor.to_param
    end

    assert_redirected_to temperature_sensors_path
  end
end
