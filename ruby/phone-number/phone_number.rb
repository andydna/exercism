class PhoneNumber
  def self.clean(phone_number)
    phone_number = phone_number.gsub(/\D+/, '')
                               .sub(/^1/, '')

    return nil unless phone_number.length == 10
    return nil unless (2..9).cover? phone_number[0].to_i
    return nil unless (2..9).cover? phone_number[3].to_i

    phone_number
  end
end

module BookKeeping
  VERSION = 2
end
