import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steadycalendar/providers/session_provider.dart';
import 'package:steadycalendar/screens/cal_pager/cal_view/cal_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CalPager extends StatelessWidget {
  const CalPager({super.key});
  static const String routeName = 'intro/calpager';

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(builder: (context, session, _) {
      return Scaffold(
          body: Stack(
        children: [
          PageView(
            children: session.cals.map((cal) => CalView(cal)).toList(),
          ),
          (Supabase.instance.client.auth.currentUser != null
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Text(Supabase.instance.client.auth.currentUser!.email
                          .toString()),
                      TextButton(
                          onPressed: _logOut, child: const Text("Log Out"))
                    ]))
              : Container())
        ],
      ));
    });
  }

  _logOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}
