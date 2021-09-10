require "test_helper"

class ListMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get list_members_create_url
    assert_response :success
  end
end
