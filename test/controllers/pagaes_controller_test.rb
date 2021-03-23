require 'test_helper'

class PagaesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pagaes_home_url
    assert_response :success
  end

end
