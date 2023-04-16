import 'package:fife/flows/alarm/ui/alarm_page.dart';
import 'package:fife/flows/auth/api/service.dart';
import 'package:fife/flows/auth/ui/login.dart';
import 'package:fife/flows/auth/ui/phone_number_code_input.dart';
import 'package:fife/flows/auth/ui/phone_number_login.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final signedIn = GetIt.I.get<AuthService>().signedIn!;
    return MaterialApp(
      home: signedIn ? AlarmPage() : const Login(),
      theme: ThemeData.dark(),
      routes: routes,
    );
  }

  Map<String, Widget Function(BuildContext context)> get routes {
    return {
      '/auth/login': (c) => const Login(),
      '/auth/login/phone': (c) => const PhoneNumberLogin(),
      '/auth/login/phone/verify': (c) => const PhoneNumberCodeInput(),
      '/alarm': (c) => AlarmPage(),
    };
  }
}
