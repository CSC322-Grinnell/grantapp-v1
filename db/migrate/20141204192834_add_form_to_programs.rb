class AddFormToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :form, :string
  end
end
