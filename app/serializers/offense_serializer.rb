# frozen_string_literal: true

module OffenseSerializer
  extend ActiveSupport::Concern

  included do
    def cerialize_offense_collection
        {title: title,
         description: description,
         created_by: user.cerialize_for_login,
         created_at: created_at,
         id: id
        }
    end

    def cerialize
      slice(:id,
            :description,
            :created_at,
            :title)
    end

  end
end
