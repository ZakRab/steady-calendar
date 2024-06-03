import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steadycalendar/providers/session_provider.dart';
import 'package:steadycalendar/repositories/cal_repo.dart';
import 'package:steadycalendar/repositories/cal_repo_interface.dart';
import 'package:steadycalendar/screens/cal_pager/cal_pager.dart';
import 'package:steadycalendar/screens/intro/intro.dart';
import 'package:steadycalendar/screens/login_options/login_options.dart';
import 'package:steadycalendar/screens/splash/spash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Steady Calendar',
        initialRoute: Splash.routeName,
        routes: {
          Splash.routeName: (context) => const Splash(),
          Intro.routeName: (context) => const Intro(),
          LoginOptions.routeName: (context) => const LoginOptions(),
          CalPager.routeName: (context) => const CalPager(),
        });
  }
}

Future<void> runAppWithOptions(
    {String envFileName = '.env',
    CalRepoInterface calendarRepo = const CalendarRepository()}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await load(fileName: '.env');
  await Supabase.initialize(
      url: "https://${env['SUPABASE_PROJECT_ID']!}.supabase.co",
      anonKey: env['SUPABASE_ANON_KEY']!);

  runApp(ChangeNotifierProvider(
      create: (context) => SessionProvider(calendarRepo), child: const App()));
}
