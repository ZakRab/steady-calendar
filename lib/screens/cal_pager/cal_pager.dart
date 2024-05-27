import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:steadycalendar/config/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CalPager extends StatelessWidget {
  const CalPager({super.key});
  static const String routeName = 'intro/calpager';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
            children: [
          'adventures-begin-mug_3x.png',
          'apple-and-juice_3x.png',
          'apples-on-tree_3x.png'
        ]
                .map((name) => CachedNetworkImage(
                      imageUrl:
                          "${baseBackgroundImageURL(env['SUPABASE_PROJECT_ID']!)}/$name",
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ))
                .toList()),
        (Supabase.instance.client.auth.currentUser != null
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(Supabase.instance.client.auth.currentUser!.id),
                    TextButton(onPressed: _logOut, child: const Text("Log Out"))
                  ]))
            : Container())
      ],
    ));
  }

  _logOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}
