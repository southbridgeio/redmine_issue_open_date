# redmine_issue_open_date

Плагин разработан [Centos-admin.ru](http://centos-admin.ru/).

Плагин предназначен для открытия замороженных задач в назначенный день.

## Алгоритм работы

В 00:01 выполнится `rake issue_open_date:switch`.

Сделается выборка всех задач со статусом "Заморожена", дата открытия которых установлена на текущий день.

Для каждой задачи будет выставлен статус открытой.

Статусы "Замороженной" и "Открытой" задачи выбираются в настройках плагина.

## Установка и настройка плагина

После установки плагина необходимо запустить миграции для базы данных:

```
bundle exec rake redmine:plugins:migrate
```

В настойках плгина укажите задачи с какими статусами считать "Замороженным", с каким - "Открытой".

## CRON

Для добавления ежедневной задачи в CRON:

```
bundle exec whenever -i redmine_issue_open_date -f plugins/redmine_issue_open_date/config/schedule.rb
```

Для очистки CRON:

```
bundle exec whenever -c redmine_issue_open_date -f plugins/redmine_issue_open_date/config/schedule.rb
```

