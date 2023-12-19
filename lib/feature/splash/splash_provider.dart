// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tubitak_2/product/navigation/app_router.dart';
import 'package:tubitak_2/product/utility/enums/cache_items.dart';

class SplashProvider extends StateNotifier<SplashProviderState> {
  SplashProvider() : super(SplashProviderState());

  Future<void> fetchUserDetail(User? user, BuildContext context) async {
    if (user == null) {
      await context.pushRoute(const LoginRoute());
    }

    final token = await user?.getIdToken();
    await tokenSaveToCache(token!);
    state = state.copyWith(isRedirect: true);
  }

  Future<void> tokenSaveToCache(String token) async {
    await CacheItems.token.write(token);
    state = state.copyWith(isRedirect: true);
  }
}

class SplashProviderState {
  SplashProviderState({this.isRedirect = false});

  final bool isRedirect;

  List<Object> get props => [isRedirect];

  SplashProviderState copyWith({
    bool? isRedirect,
  }) {
    return SplashProviderState(
      isRedirect: isRedirect ?? this.isRedirect,
    );
  }
}
