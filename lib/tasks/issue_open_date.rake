namespace :issue_open_date do
  task :switch => :environment do
    log = Rails.env.production? ? Logger.new(Rails.root.join('log/issue_open_date', 'switch-task.log')) : Logger.new(STDOUT)

    freezed_status_ids = Setting.plugin_redmine_issue_open_date['freezed_statuses'] || []
    open_status_id = Setting.plugin_redmine_issue_open_date['open_status']

    Issue.where(status_id: freezed_status_ids, open_date: Date.today).find_each do |issue|
      log.debug issue.inspect
      issue.init_journal(User.current)
      issue.status_id = open_status_id
      issue.open_date = nil
      issue.save
    end

  end
end
