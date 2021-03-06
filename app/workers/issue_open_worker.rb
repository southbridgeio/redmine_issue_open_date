class IssueOpenWorker
  include Sidekiq::Worker if Gem.loaded_specs.key?('sidekiq')

  def perform
    log = Rails.env.production? ? Logger.new(Rails.root.join('log/issue_open_date', 'switch-task.log')) : Logger.new(STDOUT)

    freezed_status_ids = Setting.plugin_redmine_issue_open_date['freezed_statuses'] || []
    open_status_id = Setting.plugin_redmine_issue_open_date['open_status']

    Issue.where('status_id IN(?) AND open_date <= ?', freezed_status_ids, Time.now).find_each do |issue|
      log.debug issue.inspect
      issue.init_journal(User.anonymous)
      issue.status_id = open_status_id
      issue.open_date = nil
      issue.save
    end
  end
end
