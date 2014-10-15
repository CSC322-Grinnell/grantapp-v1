=begin ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

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

  filter :email
  filter :role
  filter :active
  filter :organization
  filter :username

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end

=end
