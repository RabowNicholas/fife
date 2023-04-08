import 'package:fife/app_root.dart';
import 'package:fife/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

void main() {
  configureApp().then((_) {
    runApp(const AppRoot());
  });
}

Future<void> configureApp() async {
  GetIt.I.registerLazySingleton<FifeTheme>(() => FifeTheme());
}
