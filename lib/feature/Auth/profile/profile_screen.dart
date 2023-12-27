// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as profile;
import 'package:flutter/material.dart';
import 'package:tubitak_2/product/navigation/app_router.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profile.ProfileScreen(
        actions: [
          profile.SignedOutAction((context) {
            _signOut();
            context.pushRoute(LoginRoute(onResult: (bool) {}));
          }),
        ],
        appBar: AppBar(),
      ),
    );
  }
}
