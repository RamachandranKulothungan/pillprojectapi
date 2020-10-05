json.extract! user, :id, :name, :email, :contact, :country, :blood_group, 
                    :height, :weight, :dob, :created_at, :updated_at
json.url user_url(user, format: :json)
json.profile_image rails_blob_url(user.profile_image) if user.profile_image.present?
json.profile_image2 @direct_url if user.profile_image.present?