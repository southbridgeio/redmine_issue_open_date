class AddIssueOpenTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :issue_open_time, :time
  end
end
