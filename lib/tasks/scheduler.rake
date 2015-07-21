namespace :scheduler do
  desc "Updates realm lists from official Blizzard Servers"
  task update_realmlist: :environment do
    realm_list = BattleNetApi.get_realm_list
    realm_list.each do |region, realms|
      region = Region.find_by(name: region.to_s)
      realms.each do |realm, slug|
        Realm.create!(name: realm, slug: slug, region: region) unless Realm.find_by(slug: slug)
      end
    end
  end

end
