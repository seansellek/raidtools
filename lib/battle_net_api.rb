require 'httparty'

class BattleNetApi
  API_KEY = '4r5n44tnd8hr3278mj5573ewwydghk76'
  def self.get_realm_list
    options = {}
    options[:US] = {query: {locale: 'en_US', apikey: API_KEY}}
    options[:EU] = {query: {locale: 'en_GB', apikey: API_KEY}}
    realmlist = {}
    options.each do |region, query|
      response = HTTParty.get(api_url(region)+'realm/status', query)
      json = JSON.parse(response.body)
      realmlist[region] = Hash[json['realms'].map{|realm| [realm['name'], realm['slug']]}]
    end
    return realmlist
  end

  def self.api_url(region)
      "https://#{region.to_s.downcase}.api.battle.net/wow/" if [:US, :EU].include? region
  end
end
