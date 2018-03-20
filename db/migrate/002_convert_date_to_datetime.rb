class ConvertDateToDatetime < ActiveRecord::Migration
  def change
    change_column :issues, :open_date, :datetime
  end
end
