import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_website/main_page.dart';

import 'config/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: 'assets/lang',
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      saveLocale: true,
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TWO',
        theme: AppTheme.getTheme(),
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        home: const MainPage());
  }
}
