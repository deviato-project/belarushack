ActiveAdmin.register User do
  permit_params :user_type_id, :name, :contact, :surname, :title, :description, :funding_reason, :funding_amount_cents, :funding_amount_currency, :status

   member_action :take_it, method: :put do
    resource.update(responsible_admin_user: current_admin_user)
    redirect_to resources_path, notice: 'Взят в работу!'
  end

  index do
    selectable_column
    id_column
    column :user_type
    column :status do |user|
      User::STATUSES_RU[user.status.to_sym]
    end
    column :email
    column :contact
    column :name
    column :surname
    column :title
    column :description do |user|
      user.description.truncate(50, omission: '...') if user.description.present?
    end
    column :funding_reason
    column :funding_amount
    column :attachments do |user|
      user.attachments.count
    end
    column :responsible_admin_user do |user|
      if user.responsible_admin_user.blank?
        link_to 'Взять себе!', take_it_admin_user_path(user), method: :put
      else
        link_to(
          user.responsible_admin_user.name || user.responsible_admin_user.email,
          admin_admin_user_path(user.responsible_admin_user)
        )
      end
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :user_type
      row :status do |user|
        User::STATUSES_RU[user.status.to_sym]
      end
      row :email
      row :contact
      row :name
      row :surname
      row :title
      row :description do |user|
        user.description.truncate(50, omission: '...') if user.description.present?
      end
      row :funding_reason
      row :funding_amount
      row :attachments do |user|
        user.attachments.map do |attachment|
          [
            image_tag(url_for(attachment), height: '300'),
            link_to('Скачать', rails_blob_path(attachment, disposition: "attachment"))
          ]
        end
      end
      row :responsible_admin_user do |user|
        if user.responsible_admin_user.blank?
          link_to 'Взять себе!', take_it_admin_user_path(user), method: :put
        else
          link_to(
            user.responsible_admin_user.name || user.responsible_admin_user.email,
            admin_admin_user_path(user.responsible_admin_user)
          )
        end
      end
      row :created_at
      row :updated_at
    end
  end
end
