// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';
import 'package:tubitak_2/firebase_options.dart';
import 'package:tubitak_2/product/init/app_cache.dart';

@immutable
final class ApplicationInitialize {
  Future<void> make() async {
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
  }

  Future<void> _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await AppCache.instance.setup();

    /// Uygulama başlarken nereden çizilmeye başlanacak
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await DeviceUtility.instance.initPackageInfo();
    FlutterError.onError = (details) {
      //for crashlytics
      Logger().e(details.exceptionAsString());
    };
    FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  }
}
