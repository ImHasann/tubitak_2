// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tubitak_2/feature/Auth/constants/text_constants.dart';
import 'package:tubitak_2/product/utility/widgets/Auth/Button/primary_button.dart';
import 'package:tubitak_2/product/utility/widgets/Auth/Text/info_about_screen_text.dart';
import 'package:tubitak_2/product/utility/widgets/Auth/TextField/modern_text_field.dart';

@RoutePage()
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding.medium,
        child: Column(
          children: [
            const InfoTextAboutWidget(
              primaryText: AuthStringConstants.forgotPassword,
              secondaryText: AuthStringConstants.forgotPasswordExplain,
            ),
            context.sized.emptySizedHeightBoxNormal,
            const ModernTextField(
              hintText: AuthStringConstants.email,
              prefixIcon: Icon(Icons.mail_outline),
            ),
            context.sized.emptySizedHeightBoxLow,
            PrimaryButton(
              buttonText: 'Sonraki',
              buttonFunction: () {
                print('asdasd');
              },
            ),
          ],
        ),
      ),
    );
  }
}
