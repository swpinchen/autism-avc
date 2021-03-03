require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get change" do
    get settings_change_url
    assert_response :success
  end

end
