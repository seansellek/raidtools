require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
  def setup
    @character = characters(:nesaru)
    # @character.realm = realms(:hyjal)
  end
  test "should get index" do
    get :index
    assert_response :success, "Must return successful response"
    assert_not_nil assigns(:characters), "must assign a characters variable"
  end
end
