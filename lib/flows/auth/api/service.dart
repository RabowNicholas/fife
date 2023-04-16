import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<void> sendVerificationCode({
    required String phoneNumber,
    required void Function(FirebaseAuthException e) onFailed,
    required void Function(String verificationId, int? resendToken) onSent,
  });
  Future<void> resendVerificationCode(
      {required String phoneNumber,
      required void Function(FirebaseAuthException e) onFailed,
      required void Function(String verificationId, int? resendToken) onSent,
      required int resendToken});

  Future<void> signInWithCredential(AuthCredential credential);

  String? phoneNumber;
  String? verificationId;
  int? resendToken;
  bool? signedIn;
}

class ProductionAuthService extends AuthService {
  @override
  Future<void> sendVerificationCode({
    required String phoneNumber,
    required void Function(FirebaseAuthException e) onFailed,
    required void Function(String verificationId, int? resendToken) onSent,
  }) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (_) {},
      verificationFailed: (FirebaseAuthException e) => onFailed(e),
      codeSent: (String verificationId, int? resendToken) =>
          onSent(verificationId, resendToken),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Future<void> resendVerificationCode({
    required String phoneNumber,
    required void Function(FirebaseAuthException e) onFailed,
    required void Function(String verificationId, int? resendToken) onSent,
    required int resendToken,
  }) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (_) {},
      verificationFailed: (FirebaseAuthException e) => onFailed(e),
      codeSent: (String verificationId, int? resendToken) =>
          onSent(verificationId, resendToken),
      codeAutoRetrievalTimeout: (String verificationId) {},
      forceResendingToken: resendToken,
    );
  }

  @override
  Future<void> signInWithCredential(AuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
