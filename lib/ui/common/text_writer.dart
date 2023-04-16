import 'package:fife/style.dart';
import 'package:flutter/cupertino.dart';

class TextWriter extends StatelessWidget {
  const TextWriter({
    required this.text,
    this.style = const FifeTextStyle(),
    this.textAlign,
    super.key,
  });

  final String text;
  final FifeTextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.toTextStyle(),
      textAlign: textAlign,
    );
  }
}
