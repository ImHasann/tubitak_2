// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as profile;
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profile.ProfileScreen(
        appBar: AppBar(),
      ),
    );
  }
}
