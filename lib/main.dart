import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:steadycalendar/providers/session_provider.dart';
import 'package:steadycalendar/repositories/cal_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';

void main() async {
  runAppWithOptions(envFileName: '.env');
}
