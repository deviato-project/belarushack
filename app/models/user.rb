class User < ApplicationRecord
  ALLOWED_ATTACHMENT_TYPES = %w(application/pdf image/jpeg image/png)
  STATUSES_RU = {
    pending: 'В ожидании',
    processing: 'В обработке',
    approved: 'Выплата одобрена',
    payout_sent: 'Выплата произведена',
    rejected: 'Отказано'
  }.freeze
  enum status: { pending: 0, processing: 1, approved: 2, payout_sent: 3, rejected: 4 }
  monetize :funding_amount_cents
  has_many_attached :attachments
  belongs_to :user_type
  belongs_to :responsible_admin_user, class_name: 'AdminUser', optional: true

  validate :correct_attachments_mime_type

  def correct_attachments_mime_type
    if attachments.attached? && !attachments.all? { |attachment| attachment.content_type.in?(ALLOWED_ATTACHMENT_TYPES) }
      errors.add(:attachments, 'Must be a PDF or a png/jpg/jpeg file')
    end
  end
end
