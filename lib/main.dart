// ignore_for_file: public_member_api_docs

import 'package:firebase_ui_localizations/firebase_ui_localizations.dart' as firebaseLcl;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tubitak_2/product/init/application_initialize.dart';
import 'package:tubitak_2/product/init/theme/custom_light_theme.dart';
import 'package:tubitak_2/product/localization/auth_ui_localization.dart';
import 'package:tubitak_2/product/navigation/app_router.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        firebaseLcl.FirebaseUILocalizations.withDefaultOverrides(
          const LabelOverrides(),
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        firebaseLcl.FirebaseUILocalizations.delegate,
      ],
      title: 'Tübitak 2',
      theme: CustomLightTheme().themeData,
      themeMode: ThemeMode.light,
      routerConfig: _appRouter.config(),
    );
  }
}
