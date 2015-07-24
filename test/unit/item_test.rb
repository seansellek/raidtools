require 'test_helper'
class ItemTest < ActiveSupport::TestCase
  def setup
    @item = characters(:nesaru).head
    @item2 = characters(:nesaru).neck
    @item3 = Item.new()
  end

  test "item can return it's id" do
    assert_equal 115542, @item.id
  end

  test "item can return it's ilvl" do
    assert_equal 700, @item.ilvl
  end

  test "item can return array of bonuses" do
    assert_equal [567], @item.bonuses
  end

  test "item can return enchant id or false for no enchant" do
    assert_equal 5318, @item2.enchant
    assert !@item.enchant, "Item without enchant must return falsey"
  end

  test "item can report if it has a gem slot" do
    assert_not @item.gem
    assert @item2.gem
  end

  test "item can report it's set" do
    assert_equal [
          115542,
          115540,
          115543,
          115541
        ], @item.set
    assert_equal nil, @item2.set
  end

  test "item can handle nil input" do
    assert_equal 0, @item3.ilvl
  end


  # test "Item can show item id" do
  #   assert_equal 115542, @item.id
  # end
end
