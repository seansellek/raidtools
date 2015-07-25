require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "user has teams" do
    team = teams(:one)
    team.user = @user
    team.save
    assert @user.teams[0].name == team.name
  end
  
end
