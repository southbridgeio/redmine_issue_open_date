class ConvertDateToDatetime < Rails.version < '5.0' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  def change
    change_column :issues, :open_date, :datetime
  end
end
