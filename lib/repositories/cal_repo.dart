import 'package:steadycalendar/models/calendar.dart';
import 'package:steadycalendar/repositories/cal_repo_interface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CalendarRepository implements CalRepoInterface {
  const CalendarRepository();
  @override
  Future<List<Calendar>> refreshCalendars() async {
    final resp = await Supabase.instance.client
        .from('calendars')
        .select('id, name, color, background_slug, calendar_dates (date)');
    // if (resp.error != null) {
    //   throw (resp.error.toString());
    // }
    return resp.map<Calendar>((e) => Calendar.fromJson(e)).toList();
  }
}
