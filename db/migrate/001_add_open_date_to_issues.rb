class AddOpenDateToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :open_date, :date
  end
end
