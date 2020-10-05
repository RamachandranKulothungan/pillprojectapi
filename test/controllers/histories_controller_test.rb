require 'test_helper'

class HistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history = histories(:one)
  end

  test "should get index" do
    get histories_url
    assert_response :success
  end

  test "should get new" do
    get new_history_url
    assert_response :success
  end

  test "should create history" do
    assert_difference('History.count') do
      post histories_url, params: { history: { doctor: @history.doctor, dosage_amount: @history.dosage_amount, dosage_frequency: @history.dosage_frequency, dosage_time: @history.dosage_time, end_date: @history.end_date, illness: @history.illness, medicines: @history.medicines, notification: @history.notification, start_date: @history.start_date } }
    end

    assert_redirected_to history_url(History.last)
  end

  test "should show history" do
    get history_url(@history)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_url(@history)
    assert_response :success
  end

  test "should update history" do
    patch history_url(@history), params: { history: { doctor: @history.doctor, dosage_amount: @history.dosage_amount, dosage_frequency: @history.dosage_frequency, dosage_time: @history.dosage_time, end_date: @history.end_date, illness: @history.illness, medicines: @history.medicines, notification: @history.notification, start_date: @history.start_date } }
    assert_redirected_to history_url(@history)
  end

  test "should destroy history" do
    assert_difference('History.count', -1) do
      delete history_url(@history)
    end

    assert_redirected_to histories_url
  end
end
