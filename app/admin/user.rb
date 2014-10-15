ActiveAdmin.register User do
  permit_params :password, :email, :username, :role, :organization

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :username
      f.input :password
      f.input :role, :as => :select, :collection => ['Applicant','Reviewer', 'Funding Source', 'Admin']
      f.input :organization, :label => "Organization (Optional)"
    end

    f.actions :add_user
  end

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :organization
    column :active
    column :created_at
    column :username
    actions
  end

=begin  after_create { |user| user.send_reset_password_instructions }

  def password_required?
    new_record? ? false : super
  end

=end
end
