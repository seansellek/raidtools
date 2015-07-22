require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  def setup
    @character = characters(:nesaru)
  end
  test "character has realm" do
    assert @character.realm.characters.include? (@character)
  end

  test "character has region" do
    assert @character.region == @character.realm.region
  end

  test "character can update it's item data" do
    @character.refresh_item_data!
    assert_equal 18, Character.find_by(name: 'Nesaru').item_data['items'].length
  end

  test "character can read it's ilvl" do
    assert_equal 697, @character.ilvl
  end

  test "character can return items" do
    assert @character.head.class == Item
    assert @character.neck.class == Item
    assert @character.shoulder.class == Item
    assert @character.back.class == Item
    assert @character.chest.class == Item
    assert @character.wrist.class == Item
    assert @character.hands.class == Item
    assert @character.waist.class == Item
    assert @character.legs.class == Item
    assert @character.feet.class == Item
    assert @character.finger1.class == Item
    assert @character.finger2.class == Item
    assert @character.trinket1.class == Item
    assert @character.trinket2.class == Item
    assert @character.mainHand.class == Item
    assert @character.offHand.class == Item
  end

  test 'character can return array of all items' do
    assert @character.items.length == 16
   @character.items.each do |slot, item|
     assert item.class == Item, "#{item} is not of type Item"
   end
  end

  # test "the truth" do
  #   assert true
  # end
end
