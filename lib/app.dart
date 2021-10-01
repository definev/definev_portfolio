import 'package:definev/src/utils/routers.dart';
import 'package:definev/src/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppRouters.routerDelegate,
      routeInformationParser: AppRouters.routeInformationParser,
      theme: kAppTheme,
      debugShowCheckedModeBanner: false,
      locale: const Locale('vi', 'VN'),
      supportedLocales: const [Locale('vi', 'VN'), Locale('en', 'US')],
      localizationsDelegates: [DefaultMaterialLocalizations.delegate, ...context.localizationDelegates],
    );
  }
}
