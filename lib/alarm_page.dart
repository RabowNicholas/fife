import 'package:fife/fife_page.dart';
import 'package:flutter/material.dart';

class AlarmRoute extends FifeRoute {
  @override
  Uri get route => Uri(path: '/alarm');

  @override
  Widget get child => const AlarmPage();
}

abstract class FifeRoute {
  Uri get route;
  Widget get child;
}

class AlarmPage extends FifePage {
  const AlarmPage({super.key});

  @override
  Widget content(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
