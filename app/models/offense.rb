class Offense < ApplicationRecord
    include OffenseSerializer
    belongs_to :user
    has_and_belongs_to_many :offenders

end

