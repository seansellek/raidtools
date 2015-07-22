require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
  def setup
    @character = characters(:nesaru)
    @character.realm = realms(:hyjal)
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:characters)
  end
end
