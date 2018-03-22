namespace :issue_open_date do
  task :switch => :environment do
    IssueOpenWorker.new.perform
  end

  namespace :sidekiq do
    task init: :environment do
      unless Gem.loaded_specs.key?('sidekiq-cron')
        puts 'sidekiq-cron not found!'
        next
      end
      Sidekiq::Cron::Job.create(name: 'issue_open_job', cron: '*/5 * * * *', class: 'IssueOpenWorker')
    end
  end
end
