import 'package:fife/style.dart';
import 'package:fife/ui/common/text_writer.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {required this.text, required this.onTap, this.color, super.key});

  final String text;
  final Future<void> Function() onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: color ?? FifeTheme().colorScheme.blue,
                borderRadius: BorderRadius.circular(5)),
            child: GestureDetector(
              onTap: () => onTap(),
              child: TextWriter(
                text: text,
                style: FifeTheme().textScheme.normal,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
