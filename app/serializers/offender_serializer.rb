module OffenderSerializer
  extend ActiveSupport::Concern

  included do
    def cerialize_offender_collection
        {full_name: full_name,
         statement: statement,
         driver_liences_no: driver_liences_no,
         date_of_issue: date_of_issue,
         email: email,
         created_by: user.cerialize_for_login,
         created_at: created_at,
         date_of_issue: date_of_issue,
         toll_track_needed: toll_track_needed,
         address: address,
         vehicle_no: vehicle_no,
         vehicle_type: vehicle_type,
         city_town: city_town,
         injured_people: injured_people,
         number_of_poeple: number_of_poeple,
         id: id ,
         ambolance_needed: ambolance_needed,
         phone_number: phone_number
        }
    end

    def cerialize
      slice(:full_name,
            :id,
            :phone_number,
            :number_of_poeple,
            :driver_liences_no,
            :email,
            :statement,
            :address,
            :vehicle_type,
            :vehicle_no,
            :injured_people,
            :toll_track_needed,
            :date_of_issue,
            :created_at,
            :city_town,
            :ambolance_needed)
    end

  end
end
