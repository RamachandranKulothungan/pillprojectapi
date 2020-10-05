json.extract! history, :id, :illness, :doctor, :medicines, :start_date, :end_date, :dosage_amount, :dosage_frequency, :dosage_time, :notification,:user_id, :dependent_id, :created_at, :updated_at
json.url history_url(history, format: :json)
