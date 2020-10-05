json.extract! dependent, :id, :relationship, :name, :email, :contact, :dob, :blood_group, :height, :weight, :user_id, :created_at, :updated_at
json.url dependent_url(dependent, format: :json)
