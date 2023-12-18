// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tubitak_2/feature/Auth/constants/text_constants.dart';
import 'package:tubitak_2/product/utility/constants/color_constants.dart';
import 'package:tubitak_2/product/utility/widgets/Auth/Button/primary_button.dart';
import 'package:tubitak_2/product/utility/widgets/Auth/Text/info_about_screen_text.dart';
import 'package:tubitak_2/product/utility/widgets/Auth/TextField/modern_text_field.dart';

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
            const InfoTextAboutWidget(primaryText: AuthStringConstants.primaryText, secondaryText: AuthStringConstants.secondaryText),
            context.sized.emptySizedHeightBoxNormal,
            const ModernTextField(
              hintText: AuthStringConstants.email,
              prefixIcon: Icon(Icons.mail_outline),
            ),
            context.sized.emptySizedHeightBoxLow,
            const ModernTextField(
              hintText: AuthStringConstants.password,
              prefixIcon: Icon(Icons.lock_outline),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: null,
                child: Text(
                  AuthStringConstants.forgotPassword,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            PrimaryButton(buttonText: 'Sonraki', buttonFunction: () {}),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorConstants.blackLighter),
                    children: const <TextSpan>[
                      TextSpan(text: 'Hesabınız Yok Mu? '),
                      TextSpan(text: 'Hesap Oluştur', style: TextStyle(fontWeight: FontWeight.bold, color: ColorConstants.blackPrimary)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
