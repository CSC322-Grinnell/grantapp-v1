class AddFormUrlToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :form_url, :string
  end
end
