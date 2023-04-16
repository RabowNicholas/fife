import 'package:fife/fife_page.dart';
import 'package:fife/style.dart';
import 'package:fife/ui/common/clickable_widget.dart';
import 'package:fife/ui/common/spacing.dart';
import 'package:fife/ui/common/text_writer.dart';
import 'package:flutter/material.dart';

class Login extends FifePage {
  const Login({super.key});

  @override
  Widget content(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Spacing.spaceBetween([
        TextWriter(
          text: 'Log in using',
          style: FifeTheme().textScheme.medium,
        ),
        ClickableWidget(
          onTap: () {
            Navigator.pushNamed(context, '/auth/login/phone');
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: FifeTheme().colorScheme.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                const Expanded(child: Icon(Icons.phone_iphone)),
                Expanded(
                  flex: 3,
                  child: TextWriter(
                    text: 'Phone Number',
                    style: FifeTheme().textScheme.medium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 100),
      ], 10),
    );
  }
}
