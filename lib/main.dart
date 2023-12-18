// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tubitak_2/product/init/application_initialize.dart';
import 'package:tubitak_2/product/init/theme/custom_light_theme.dart';
import 'package:tubitak_2/product/navigation/app_router.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: CustomLightTheme().themeData,
      themeMode: ThemeMode.light,
      routerConfig: _appRouter.config(),
    );
  }
}
