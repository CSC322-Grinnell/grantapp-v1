class AddStartDateAndEndDateToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :start_date, :datetime
    add_column :programs, :end_date, :datetime
  end
end
