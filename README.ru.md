# Redmine Issue Open Date Plugin

*[English version](README.md)*

Плагин разработан [Centos-admin.ru](http://centos-admin.ru/).

Плагин предназначен для открытия замороженных задач в назначенный день.

Пожалуйста помогите нам сделать этот плагин лучше, сообщая во вкладке [Issues](https://github.com/centosadmin/redmine_issue_open_date/issues) обо всех проблемах, с которыми Вы столкнётесь при его использовании. Мы готовы ответить на Все ваши вопросы, касающиеся этого плагина.

## Алгоритм работы

В 00:01 выполнится `rake issue_open_date:switch`.

Сделается выборка всех задач со статусом "Заморожена", дата открытия которых установлена на текущий день.

Для каждой задачи будет выставлен статус открытой.

## Установка и настройка плагина

После установки плагина необходимо запустить миграции для базы данных:

```
bundle exec rake redmine:plugins:migrate
```

В настойках плагина укажите задачи с какими статусами считать "Замороженным", с каким - "Открытой".

## CRON

Для добавления ежедневной задачи в CRON:

```
bundle exec whenever -i redmine_issue_open_date -f plugins/redmine_issue_open_date/config/schedule.rb
```

Для очистки CRON:

```
bundle exec whenever -c redmine_issue_open_date -f plugins/redmine_issue_open_date/config/schedule.rb
```

