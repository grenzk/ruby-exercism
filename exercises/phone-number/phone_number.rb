# frozen_string_literal: true

class PhoneNumber
  def self.clean(phone_number)
    formatted = phone_number.gsub(/[\W\D]/, '').sub(/1/, '')

    if formatted.start_with?('0', '1') || %w[0 1].include?(formatted[3]) ||
         formatted.length != 10
      return nil
    end

    formatted
  end
end
