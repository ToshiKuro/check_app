require 'test_helper'

class ChecklistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checklists_index_url
    assert_response :success
  end

  test "should get new" do
    get checklists_new_url
    assert_response :success
  end

  test "should get show" do
    get checklists_show_url
    assert_response :success
  end

end
