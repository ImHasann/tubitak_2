// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: context.popRoute,
              child: Text(context.general.mediaBrightness.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
