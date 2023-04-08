import 'package:fife/style.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class FifePage extends StatelessWidget {
  const FifePage({super.key});

  Widget content(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GetIt.I.get<FifeTheme>().colorScheme.background,
      body: SafeArea(
        child: Row(
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(flex: 14, child: content(context)),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

class RootWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _RootWidgetState extends State<RootWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
