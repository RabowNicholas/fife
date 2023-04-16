import 'package:fife/fife_page.dart';
import 'package:fife/flows/auth/api/service.dart';
import 'package:fife/style.dart';
import 'package:fife/ui/common/button.dart';
import 'package:fife/ui/common/spacing.dart';
import 'package:fife/ui/common/text_writer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pinput/pinput.dart';

class PhoneNumberCodeInput extends FifePage {
  const PhoneNumberCodeInput({super.key});

  @override
  Widget content(BuildContext context) => const _VerificationCodeInput();
}

class _VerificationCodeInput extends StatefulWidget {
  const _VerificationCodeInput();

  @override
  State<StatefulWidget> createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<_VerificationCodeInput> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Spacing.spaceBetween([
          Align(
            alignment: Alignment.centerLeft,
            child: TextWriter(
              text: 'Verification Code',
              style: FifeTheme().textScheme.normal,
            ),
          ),
          Pinput(
              length: 6,
              onCompleted: (pin) {
                final authService = GetIt.I.get<AuthService>();
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: authService.verificationId!, smsCode: pin);
                authService.signInWithCredential(credential);
              }),
          Button(
            text: 'Resend Code',
            onTap: () async {
              final authService = GetIt.I.get<AuthService>();
              if (authService.phoneNumber != null &&
                  authService.resendToken != null) {
                authService.resendVerificationCode(
                    phoneNumber: authService.phoneNumber!,
                    onFailed: (e) {
                      throw Exception(e);
                    },
                    onSent: ((verificationId, resendToken) {
                      authService.verificationId = verificationId;
                      authService.resendToken = resendToken;
                    }),
                    resendToken: authService.resendToken!);
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ], 10),
      ),
    );
  }
}
