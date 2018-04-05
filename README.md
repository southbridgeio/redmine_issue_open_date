[![Rate at redmine.org](http://img.shields.io/badge/rate%20at-redmine.org-blue.svg?style=flat)](http://www.redmine.org/plugins/redmine_issue_open_date)

# Redmine Issue Open Date Plugin

*[Русская версия документации](README.ru.md)*

Plugin is developed by [Southbridge](https://southbridge.io).

This plugin is designed to reopen the frozen issues on the scheduled time.

Please help us make this plugin better telling us of any [issues](https://github.com/centosadmin/redmine_issue_open_date/issues) you'll face using it. We are ready to answer all your questions regarding this plugin.

## Short description

Plugin executes the 'rake issue_open_date:switch' command every 5 minutes

It will return all the tickets that have the _**Frozen**_ status and are scheduled to be reopened on сurrent time.

All such tickets will get the _**New**_ status.

## Plugin setup

Install the plugin and perform database migration:

```
bundle exec rake redmine:plugins:migrate
```

Specify in the plugin settings which tickets will be considered as _**New**_ or _**Frozen**_.


## CRON

Plugin supports two ways of scheduling jobs:

### Whenever

Perform this to add tasks to CRON:

```
bundle exec whenever -i redmine_issue_open_date -f *path_to_your_app*/plugins/redmine_issue_open_date/config/schedule.rb
```

Perform this to remove tasks from CRON:

```
bundle exec whenever -c redmine_issue_open_date -f *path_to_your_app*/plugins/redmine_issue_open_date/config/schedule.rb
```

### Sidekiq-cron

Run this task to inititalize sidekiq-cron job:

```
bundle exec rake issue_open_date:sidekiq:init RAILS_ENV=production
```

Note that you need to have [sidekiq-cron](https://github.com/ondrejbartas/sidekiq-cron) gem installed.
