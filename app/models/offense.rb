class Offense < ApplicationRecord
    include OffenseSerializer
    belongs_to :user
end

