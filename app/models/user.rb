class User < ApplicationRecord
  monetize :funding_amount_cents
  has_many_attached :attachments
  belongs_to :user_type
end
