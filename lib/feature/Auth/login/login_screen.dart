// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:tubitak_2/product/navigation/app_router.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding.low,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            firebase.FirebaseUIActions(
              actions: [
                ForgotPasswordAction((context, email) {
                  context.pushRoute(const ForgotPasswordRoute());
                }),
                AuthStateChangeAction<SignedIn>((context, state) async {
                  if (state.user != null) {
                    await context.pushRoute(const HomeRoute()); //kullanıcı girişi yaptıktan sonra ne olacak
                  }
                }),
              ],
              child: Expanded(
                child: firebase.SignInScreen(
                  headerBuilder: (context, constraints, _) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.network('https://firebase.flutter.dev/img/flutterfire_300x.png'),
                    );
                  },
                  showAuthActionSwitch:true,
                  styles: const {
                    EmailFormStyle(
                      signInButtonVariant: ButtonVariant.filled,
                    ),
                  },
                  subtitleBuilder: (context, action) {
                    return Text(
                      action == AuthAction.signIn
                          ? 'Uygulamaya Hoşgelidiniz.Lütfen devam etmek için giriş yapın.'
                          : 'Uygulamaya Hoşgelidiniz.Lütfen devam etmek için hesap oluşturunuz.',
                    );
                  },
                  showPasswordVisibilityToggle: true,
                  providers: firebase.FirebaseUIAuth.providersFor(FirebaseAuth.instance.app),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
