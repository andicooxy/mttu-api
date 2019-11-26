module OffenderSerializer
  extend ActiveSupport::Concern

  included do
    def cerialize_offender_collection
        {full_name: full_name,
         statement: statement,
         created_by: user.cerialize_for_login,
         created_at: created_at,
         :id 
        }
    end

    def cerialize
      slice(:full_name,
            :id,
            :statement,
            :created_at,
            :title)
    end

  end
end
