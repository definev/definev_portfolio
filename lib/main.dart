import 'package:beamer/beamer.dart';
import 'package:definev/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Beamer.setPathUrlStrategy();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => EasyLocalization(
        path: 'assets/locales',
        supportedLocales: const [Locale('vi', 'VN'), Locale('en', 'US')],
        child: const App(),
      ),
    ),
  );
}
