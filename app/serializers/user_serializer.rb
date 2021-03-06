# frozen_string_literal: true

module UserSerializer
  extend ActiveSupport::Concern

  included do
    def cerialize_users_collection
        {email: email,
         full_name: full_name,
         last_name: last_name,
         first_name: first_name,
         address: address,
         id: id,
         registered_no: registered_no,
         designation: designation,
         city_town: city_town,
         region: region.slice(:name,:id),
         department: department.slice(:id, :name)}
    end

    def cerialize_for_login
      data = slice(:email,
                   :first_name,
                   :last_password_reset_date,
                   :last_name,
                   :designation,
                   :city_town,
                   :id,
                   :registered_no,
                   :address,
                   :full_name,         
                   :verified,
                   :blocked)
      data[:offense_count] = Offense.count
      data[:users_count] = User.count
      data 
    end

    def cerialize
      slice(:email,
            :verified,
            :created_at,
            :designation,
            :blocked,
            :is_active,
            :last_name,
            :address,
            :city_town,
            :id,
            :registered_no,
            :email,
            :full_name     
            )
    end
  end
end
