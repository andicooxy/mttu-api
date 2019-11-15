class Offender < ApplicationRecord
      has_and_belongs_to_many :offenses
      belongs_to :user 
end
