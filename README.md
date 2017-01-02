# Redmine Issue Open Date Plugin

*[Русская версия документации](README.ru.md)*

Plugin is developed by [Centos-admin.ru](http://centos-admin.ru/).

This plugin is designed to reopen the frozen issues on the scheduled day.

Please help us make this plugin better telling us of any [issues](https://github.com/centosadmin/redmine_issue_open_date/issues) you'll face using it. We are ready to answer all your questions regarding this plugin.

## Short description

Plugin executes the 'rake issue_open_date:switch' command at 00:01.

It will return all the tickets that have the _**Frozen**_ status and are scheduled to be reopened on the next day.

All such tickets will get the _**New**_ status.

## Plugin setup

Install the plugin and perform database migration:

```
bundle exec rake redmine:plugins:migrate
```

Specify in the plugin settings which tickets will be considered as _**New**_ or _**Frozen**_.


## CRON

Perform this to add tasks to CRON:

```
bundle exec whenever -i redmine_issue_open_date -f plugins/redmine_issue_open_date/config/schedule.rb
```

Perform this to remove tasks from CRON:

```
bundle exec whenever -c redmine_issue_open_date -f plugins/redmine_issue_open_date/config/schedule.rb
```

