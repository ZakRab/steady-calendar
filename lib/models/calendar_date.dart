import 'dart:collection';
import 'package:intl/intl.dart';

typedef CalendarDate = DateTime;

typedef CalendarDates = HashMap<int, CalendarDate>;

const String calendarDateFormat = 'yyyy-MM-dd';

String calendarDateToString(CalendarDate value) {
  return DateFormat(calendarDateFormat).format(value);
}

CalendarDate stringToCalendarDate(String value) {
  // NOTE unfortunately, parse() uses local time which would result in converting
  // a date only value to a DateTime with a non-zero hour value, therefore we
  // parse with explicit time and 'Z' to ensure we get a zero time in UTC
  // https://github.com/dart-lang/sdk/issues/37420
  return DateTime.parse("$value 00:00:00Z");
}
