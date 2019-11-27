class Offender < ApplicationRecord
    include OffenderSerializer
      has_and_belongs_to_many :offenses
      belongs_to :user 
end
