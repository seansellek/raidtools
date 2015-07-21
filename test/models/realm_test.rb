require 'test_helper'

class RealmTest < ActiveSupport::TestCase
  test "realm has region" do
    realm = realms(:hyjal)
    region = regions(:US)
    realm.region = region
    realm.save
    assert Realm.find_by(name: 'Hyjal').region == region
  end
  # test "the truth" do
  #   assert true
  # end
end
