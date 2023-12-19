// ignore_for_file: public_member_api_docs

import 'package:tubitak_2/product/init/app_cache.dart';

enum CacheItems {
  token;

  String get read => AppCache.instance.sharedPreferences.getString(name) ?? '';

  Future<bool> write(String value) => 
  AppCache.instance.sharedPreferences.setString(name, value);
}
