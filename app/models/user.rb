class User < ApplicationRecord
  has_secure_password
  has_one_attached :profile_image
  has_many :histories
  has_many :dependents
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  
  def generate_jwt 
    JWT.encode({
      id: id,  # user_id
      exp: 60.days.from_now.to_i},
      Rails.application.secrets.secret_key_base)
  end
end
