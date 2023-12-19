// ignore_for_file: public_member_api_docs

import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  AppCache._();

  static AppCache instance = AppCache._();

  Future<void> setup() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  late SharedPreferences sharedPreferences;
} 
