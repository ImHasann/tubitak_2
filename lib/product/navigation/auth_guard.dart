// ignore_for_file: public_member_api_docs, use_if_null_to_convert_nulls_to_bools, lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tubitak_2/product/navigation/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation

    final user = FirebaseAuth.instance.currentUser;

    if (user?.uid.isEmpty == false) {
      resolver.next();
    } else {
      await router.push(
        LoginRoute(
          onResult: (result) async {
            if (result == true) {
              // if user is authenticated we continue
              resolver.next();
              router.removeLast();
            }
          },
        ),
      );
    }
  }
}
