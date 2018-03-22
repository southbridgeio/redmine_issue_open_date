[![Rate at redmine.org](http://img.shields.io/badge/rate%20at-redmine.org-blue.svg?style=flat)](http://www.redmine.org/plugins/redmine_issue_open_date)

# Redmine Issue Open Date Plugin

*[English version](README.md)*

Плагин разработан [Southbridge](https://southbridge.io).

Плагин предназначен для открытия замороженных задач в назначенное время.

Пожалуйста помогите нам сделать этот плагин лучше, сообщая во вкладке [Issues](https://github.com/centosadmin/redmine_issue_open_date/issues) обо всех проблемах, с которыми Вы столкнётесь при его использовании. Мы готовы ответить на Все ваши вопросы, касающиеся этого плагина.

## Алгоритм работы

Каждые 5 минут выполняется команда `rake issue_open_date:switch`.

Сделается выборка всех задач со статусом "Заморожена", время открытия которых больше, либо равно текущему времени.

Для каждой задачи будет выставлен статус открытой.

## Установка и настройка плагина

После установки плагина необходимо запустить миграции для базы данных:

```
bundle exec rake redmine:plugins:migrate
```

В настойках плагина укажите задачи с какими статусами считать "Замороженным", с каким - "Открытой".

## CRON

Плагин поддерживает 2 способа запуска задачи по расписанию:

### Whenever

Для добавления ежедневной задачи в CRON:

```
bundle exec whenever -i redmine_issue_open_date -f *путь к приложению*/plugins/redmine_issue_open_date/config/schedule.rb
```

Для очистки CRON:

```
bundle exec whenever -c redmine_issue_open_date -f *путь к приложению*/plugins/redmine_issue_open_date/config/schedule.rb
```

### Sidekiq-cron

Запустите для добавления задачи в sidekiq-cron:

```
bundle exec rake issue_open_date:sidekiq:init RAILS_ENV=production
```

Для работы в этом случае необходим gem [sidekiq-cron](https://github.com/ondrejbartas/sidekiq-cron).