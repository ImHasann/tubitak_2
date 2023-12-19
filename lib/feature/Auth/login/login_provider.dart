// ignore_for_file: public_member_api_docs

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tubitak_2/product/utility/enums/cache_items.dart';

class LoginNotifier extends StateNotifier<LoginNotifierState> {
  LoginNotifier() : super(LoginNotifierState());

  Future<void> fetchUserDetail(User? user) async {
    if (user == null) return;
    final token = await user.getIdToken();
    await tokenSaveToCache(token!);
    state = state.copyWith(isRedirect: true);
  }

  Future<void> tokenSaveToCache(String token) async {
    await CacheItems.token.write(token);
    state=state.copyWith(isRedirect: true);
  }
}

class LoginNotifierState {
  LoginNotifierState({this.isRedirect = false});

  final bool isRedirect;

  List<Object> get props => [isRedirect];

  LoginNotifierState copyWith({
    bool? isRedirect,
  }) {
    return LoginNotifierState(
      isRedirect: isRedirect ?? this.isRedirect,
    );
  }
}
