import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steadycalendar/providers/session_provider.dart';
import 'package:steadycalendar/screens/cal_pager/cal_pager.dart';
import 'package:steadycalendar/screens/intro/intro.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static const String routeName = '/splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  void initState() {
    super.initState();
    _authStateSubscription =
        Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final session = data.session;

      if (session != null) {
        Navigator.pushNamed(context, CalPager.routeName);
        Provider.of<SessionProvider>(context, listen: false).refreshCalendars();
      } else {
        Navigator.pushNamed(context, Intro.routeName);
      }
    });
  }

  @override
  void dispose() {
    _authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
