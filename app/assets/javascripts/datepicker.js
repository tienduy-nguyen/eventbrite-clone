//= require flatpickr

document.addEventListener('DOMContentLoaded', function () {
  flatpickr('.dpicker', {
    enableTime: false,
    altInput: true,
    minDate: 'today',
    altFormat: 'F j, Y',
    dateFormat: 'Y-m-d',
    defaultDate: 'today',
  });
  flatpickr('.tpicker', {
    enableTime: true,
    noCalendar: true,
    altInput: true,
    altFormat: 'h:i K',
    dateFormat: 'H:i',
    defaultHour: 23,
    defaultMinute: 59,
    minuteIncrement: 15,
    defaultDate: '09:00',
  });
});
