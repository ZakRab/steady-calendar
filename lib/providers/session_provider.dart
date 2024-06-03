import 'package:flutter/material.dart';
import 'package:steadycalendar/models/calendar.dart';
import 'package:steadycalendar/repositories/cal_repo_interface.dart';

class SessionProvider extends ChangeNotifier {
  List<Calendar> _cals = [];
  List<Calendar> get cals => _cals;
  CalRepoInterface calRepo;

  SessionProvider(this.calRepo);

  refreshCalendars() async {
    _cals = await calRepo.refreshCalendars();

    notifyListeners();
  }
}
