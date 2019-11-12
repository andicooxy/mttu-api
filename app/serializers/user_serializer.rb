# frozen_string_literal: true

module UserSerializer
  extend ActiveSupport::Concern

  included do
    def self.cerialize_business_collection(business)
    end

    def self.cerialize_collection 
      select(:has_reset_password, 
              :active,
              :email,
              :client_code,
              :first_name,
              :last_password_reset_date,
              :last_name,
              :full_name,
              :active,
              :verified,       
              :blocked)
    end

    def cerialize_for_login
      data = slice(:has_reset_password, 
                   :email,
                   :first_name,
                   :last_password_reset_date,
                   :last_name,
                   :full_name,
         
                   :verified,
                   :blocked)
    end

    def cerialize
      slice(
            :verified,
            :created_at,
            :blocked,
            :is_active,
            :last_name,
            :email,
            :full_name     
            )
    end

    private 
    def has_businesses
       businesses.present?? true : false 
    end
  end
end
