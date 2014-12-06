class AddInfoToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :info, :text
  end
end
