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
  controller do
    def update
      
      @user = User.find(params[:id])
      if params[:user][:password].blank?
        @user.update_without_password(user_params)
      else
        @user.update_attributes(user_params)
      end
      if @user.errors.blank?
        redirect_to admin_users_path, :notice => "User updated successfully."
      else
        render :edit
      end
    end

    private
    def user_params
      params[:user].permit(:username, :organization, :role)
    end
  end

end
