// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tubitak_2/feature/home/view/constants/text_constants.dart';
import 'package:tubitak_2/product/utility/widgets/Text/info_about_screen_text.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const InfoTextAboutWidget(primaryText: LoginScreenStringConstants.primaryText, secondaryText: LoginScreenStringConstants.secondaryText),
            context.sized.emptySizedHeightBoxNormal,
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: context.border.lowBorderRadius),
                hintText: LoginScreenStringConstants.email,
                hintStyle: Theme.of(context).textTheme.titleMedium,
                prefixIcon: const Icon(Icons.mail_outline_outlined),
              ),
            ),
            context.sized.emptySizedHeightBoxLow,
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: context.border.lowBorderRadius),
                hintText: LoginScreenStringConstants.password,
                hintStyle: Theme.of(context).textTheme.titleMedium,
                prefixIcon: const Icon(Icons.lock_outline),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: null,
                child: Text(
                  LoginScreenStringConstants.forgotPassword,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
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
