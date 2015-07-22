require 'test_helper'

class BattleNetApiTest < ActiveSupport::TestCase
  test "retrieves character data" do
    chr = characters(:nesaru)
    data = BattleNetApi.get_character_data(chr)
    assert_equal 18, data["items"].length
  end

  # test "the truth" do
  #   assert true
  # end
end
