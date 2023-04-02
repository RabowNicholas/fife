import 'package:flutter/cupertino.dart';

abstract class FifePage extends StatelessWidget {
  const FifePage({super.key});

  Widget content(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: content(context),
    );
  }
}
