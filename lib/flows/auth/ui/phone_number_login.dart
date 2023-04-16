import 'package:fife/fife_page.dart';
import 'package:fife/flows/alarm/ui/alarm_page.dart';
import 'package:fife/flows/auth/api/service.dart';
import 'package:fife/style.dart';
import 'package:fife/ui/common/button.dart';
import 'package:fife/ui/common/clickable_widget.dart';
import 'package:fife/ui/common/spacing.dart';
import 'package:fife/ui/common/text_writer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class PhoneNumberLogin extends FifePage {
  const PhoneNumberLogin({super.key});
  @override
  Widget content(BuildContext context) {
    return const _PhoneNumberEntry();
  }
}

class _PhoneNumberEntry extends StatefulWidget {
  const _PhoneNumberEntry();

  @override
  State<StatefulWidget> createState() => _PhoneNumberEntryState();
}

class _PhoneNumberEntryState extends State<_PhoneNumberEntry> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Spacing.spaceBetween([
        TextWriter(
          text: 'Phone Number',
          style: FifeTheme().textScheme.normal,
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
              isDense: true,
              hintText: '+1 (800) 555-1234',
              border: OutlineInputBorder()),
          inputFormatters: [
            InternationalPhoneFormatter(),
          ],
          onChanged: (value) {
            GetIt.I.get<AuthService>().phoneNumber = controller.text;
          },
        ),
        Align(
          alignment: Alignment.center,
          child: Button(
              text: 'Send Code',
              onTap: () async {
                final service = GetIt.I.get<AuthService>();
                service.sendVerificationCode(
                  phoneNumber: GetIt.I.get<AuthService>().phoneNumber!,
                  onSent: (String verificationId, int? resendToken) {
                    final authService = GetIt.I.get<AuthService>();
                    authService.verificationId = verificationId;
                    authService.resendToken = resendToken;
                    Navigator.pushNamed(context, '/auth/login/phone/verify');
                  },
                  onFailed: (FirebaseAuthException e) {
                    throw Exception(e);
                  },
                );
              }),
        ),
      ], 10),
    );
  }
}

class InternationalPhoneFormatter extends TextInputFormatter {
  String internationalPhoneFormat(value) {
    String nums = value.replaceAll(RegExp(r'[\D]'), '');
    String internationalPhoneFormatted = nums.isNotEmpty
        ? '+${nums.substring(0, nums.isNotEmpty ? 1 : null)}${nums.length > 1 ? ' (' : ''}${nums.substring(1, nums.length >= 4 ? 4 : null)}${nums.length > 4 ? ') ' : ''}${nums.length > 4 ? nums.substring(4, nums.length >= 7 ? 7 : null) + (nums.length > 7 ? '-${nums.substring(7, nums.length >= 11 ? 11 : null)}' : '') : ''}'
        : nums;
    return internationalPhoneFormatted;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    return newValue.copyWith(
        text: internationalPhoneFormat(text),
        selection: TextSelection.collapsed(
            offset: internationalPhoneFormat(text).length));
  }
}
