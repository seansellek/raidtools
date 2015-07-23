require 'test_helper'
def TooltipForTest < ActiveSupport::TestCase
  def setup
    @character = characters(:nesaru)
    @item = @character.head
  end
