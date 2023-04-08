import 'package:flutter/cupertino.dart';

class ClickableWidget extends StatelessWidget {
  const ClickableWidget({required this.child, this.onTap, super.key});

  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!() : null,
      child: child,
    );
  }
}
