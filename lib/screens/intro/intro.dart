import 'package:flutter/material.dart';
import 'package:steadycalendar/components/sc_flat_button.dart';
import 'package:steadycalendar/screens/login_options/login_options.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});
  static const String routeName = '/intro';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              5,
              (index) => Image.asset(
                    "assets/images/iphone-valprop-$index@3x.png",
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  )),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: 60.0,
          bottom: 50.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SCFlatButton(
              const Text("Get Started"),
              onTap: () => Navigator.pushNamed(context, LoginOptions.routeName),
            ),
          ),
        )
      ],
    );
  }
}
