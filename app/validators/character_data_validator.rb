class CharacterDataValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    unless value && value['items']
      record.errors[attribute] << (options[:message] || "Invalid Item Data")
    end
  end
end
