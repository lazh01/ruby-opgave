require "test_helper"

class ChatRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get chat_rooms_list_url
    assert_response :success
  end
end
