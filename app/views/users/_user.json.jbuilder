json.extract! user, :id, :user_type_id, :name, :surname, :title, :description, :funding_reason, :funding_amount, :status, :created_at, :updated_at
json.url user_url(user, format: :json)
