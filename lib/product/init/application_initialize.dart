// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

@immutable
final class ApplicationInitialize {
  Future<void> make() async {
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
  }

  Future<void> _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// Uygulama başlarken nereden çizilmeye başlanacak
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await DeviceUtility.instance.initPackageInfo();
    FlutterError.onError = (details) {
      //for crashlytics
      Logger().e(details.exceptionAsString());
    };
  }
}
