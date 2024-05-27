import 'dart:async';

import 'package:flutter/material.dart';
import 'package:steadycalendar/screens/cal_pager/cal_pager.dart';
import 'package:steadycalendar/screens/login_options/login_options.dart';
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
      } else {
        Navigator.pushNamed(context, LoginOptions.routeName);
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
