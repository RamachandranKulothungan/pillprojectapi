class History < ApplicationRecord
    belongs_to :user
    belongs_to :dependent, optional: true
end
