import 'package:fife/alarm_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: const AlarmPage(),
      routes: routes,
    );
  }

  Map<String, Widget Function(BuildContext context)> get routes {
    return {
      '/alarm': (c) => const AlarmPage(),
    };
  }
}
