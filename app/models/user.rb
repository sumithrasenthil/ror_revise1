class User < ApplicationRecord
    has_secure_password
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    before_validation :normalize_mobile_number

    private

    def normalize_mobile_number
        return if mobile_number.blank?

        parsed =
        if country_code.present?
            Phonelib.parse(mobile_number, country_code)
        else
            Phonelib.parse(mobile_number)
        end


        self.country_code = parsed.country_code.to_s || '91'
        self.mobile_number = parsed.national
  end
end
