# Redmine Issue Open Date Plugin

*[Русская версия документации](README.ru.md)*

Plugin developed by [Centos-admin.ru](http://centos-admin.ru/).

This plugin is designed to open the frozen issues on the scheduled day.

## Short description

At 00:01 executed `rake issue_open_date:switch`.

Fetches all issues with a status of _**frozen**_, the opening date that is set for the current day.

For each issue status will be put _**open**_.

"Frozen" and "Open" statuses is setup in the plugin settings.

## Plugin setup

After installing the plugin, you must run the database migration:

```
bundle exec rake redmine:plugins:migrate
```

Setup **_Frozen_** and **_Open_** statuses in plugin settings.

## CRON

To add a daily task in CRON:

```
bundle exec whenever -i redmine_issue_open_date -f plugins/redmine_issue_open_date/config/schedule.rb
```

To clean CRON:

```
bundle exec whenever -c redmine_issue_open_date -f plugins/redmine_issue_open_date/config/schedule.rb
```

