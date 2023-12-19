// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tubitak_2/feature/splash/splash_provider.dart';
import 'package:tubitak_2/product/navigation/app_router.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with _SplashViewListenMixin {
  final splashProvider = StateNotifierProvider<SplashProvider, SplashProviderState>((ref) {
    return SplashProvider();
  });

  @override
  void initState() {
    super.initState();
    checkUser(FirebaseAuth.instance.currentUser);
  }

  void checkUser(User? user) {
    ref.read(splashProvider.notifier).fetchUserDetail(user,context);
  }

  @override
  Widget build(BuildContext context) {
    listenAndNavigate(splashProvider);
    return const Scaffold(
      body: Center(
        child: Text('asdasd'),
      ),
    );
  }
}

mixin _SplashViewListenMixin on ConsumerState<SplashScreen> {
  void listenAndNavigate(
    StateNotifierProvider<SplashProvider, SplashProviderState> provider,
  ) {
    ref.listen(provider, (previous, next) {
      if (next.isRedirect) {
        context.pushRoute(const HomeRoute());
      } else {
        print('error');
      }
    });
  }
}
