$(document).ready(function () {
  jQuery.datetimepicker.setLocale('ru');
  $('#issue_open_date').datetimepicker({
    format: 'd.m.Y H:i',
    step: 5,
    minDate: '-1970/01/01'
  });
});
