# redmine_issue_open_date

Для добавления ежедневной задачи в CRON:

```
bundle exec whenever -i redmine_issue_open_date -f plugins/redmine_issue_open_date/config/schedule.rb
```

Для очистки CRON:

```
bundle exec whenever -c redmine_issue_open_date -f plugins/redmine_issue_open_date/config/schedule.rb
```

В 00:01 выполнится `rake issue_open_date:switch`.

Сделается выборка всех задач со статусом "Заморожена", дата открытия которых установлена на текущий день.

Для каждой задачи будет выставлен статус открытой.

Статусы "Замороженной" и "Открытой" задачи выбираются в настройках плагина.
