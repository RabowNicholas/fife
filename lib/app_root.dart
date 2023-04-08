import 'package:fife/ui/alarm/alarm_page.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlarmPage(),
      theme: ThemeData.dark(),
      routes: routes,
    );
  }

  Map<String, Widget Function(BuildContext context)> get routes {
    return {
      '/alarm': (c) => AlarmPage(),
    };
  }
}
