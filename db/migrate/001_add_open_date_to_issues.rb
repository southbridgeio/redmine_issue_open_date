class AddOpenDateToIssues < Rails.version < '5.0' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  def change
    add_column :issues, :open_date, :date
  end
end
