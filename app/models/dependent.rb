class Dependent < ApplicationRecord
    belongs_to :user
    has_many :histories
    validates :name, presence: true
    validates :relationship, presence: true
    validates :email, presence: true
end
