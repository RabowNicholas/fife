import 'package:fife/app_root.dart';
import 'package:fife/firebase_options.dart';
import 'package:fife/flows/auth/api/service.dart';
import 'package:fife/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

void main() {
  configureApp().then((_) {
    runApp(const AppRoot());
  });
}

Future<void> configureApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  GetIt.I.registerLazySingleton<FifeTheme>(() => FifeTheme());
  GetIt.I.registerLazySingleton<AuthService>(() => ProductionAuthService());
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      GetIt.I.get<AuthService>().signedIn = false;
    } else {
      GetIt.I.get<AuthService>().signedIn = true;
    }
  });
}
