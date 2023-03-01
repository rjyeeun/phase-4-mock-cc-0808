class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates :name, presence: true
    validates :age, numericality: { greater_than: 7, less_than: 19}
    #inclustion: { in: 8..18, message: "must have an age between 8 and 18"}
end
