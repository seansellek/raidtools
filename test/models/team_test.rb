require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  def setup
    @team = teams(:one)
    @character = characters(:nesaru)
    @character.team = @team
    @character.save
  end
  test "Has characters" do
    assert @team.characters[0] = @character
  end
  test "can report average ilvl" do
    assert @team.ilvl == @character.ilvl
  end
end
