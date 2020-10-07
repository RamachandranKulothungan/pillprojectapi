class History < ApplicationRecord
    belongs_to :user
    belongs_to :dependent, optional: true
    validates :illness, presence: true
    validates :doctor, presence: true
    validates :medicines, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
end
