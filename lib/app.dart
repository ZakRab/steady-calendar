import 'package:flutter/material.dart';
import 'package:steadycalendar/screens/cal_pager/cal_pager.dart';
import 'package:steadycalendar/screens/intro/intro.dart';
import 'package:steadycalendar/screens/login_options/login_options.dart';
import 'package:steadycalendar/screens/splash/spash.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Steady Calendar',
        initialRoute: Intro.routeName, //TODO splaash.routename
        routes: {
          Splash.routeName: (context) => const Splash(),
          Intro.routeName: (context) => const Intro(),
          LoginOptions.routeName: (context) => const LoginOptions(),
          CalPager.routeName: (context) => const CalPager(),
        });
  }
}
