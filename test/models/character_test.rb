require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  test "character has realm" do
    character = characters(:nesaru)
    assert character.realm.characters.include? (character)
  end

  test "character has region" do
    character = characters(:nesaru)
    assert character.region == character.realm.region
  end

  test "character can update it's item data" do
    character = characters(:nesaru)
    character.refresh_item_data
    assert_equal 18, character.item_data['items'].length
  end
  # test "the truth" do
  #   assert true
  # end
end
