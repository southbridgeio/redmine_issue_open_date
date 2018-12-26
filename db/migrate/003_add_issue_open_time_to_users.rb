class AddIssueOpenTimeToUsers < Rails.version < '5.0' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  def change
    add_column :users, :issue_open_time, :time
  end
end
