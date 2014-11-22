class AddPendingToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :pending, :boolean
  end
end
