// ignore_for_file: public_member_api_docs, avoid_unnecessary_containers, use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tubitak_2/product/navigation/app_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home'),
            ElevatedButton(
              onPressed: () {
                context.pushRoute(const LoginRoute());
              },
              child: const Text('logine gidiş'),
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await context.pushRoute(const LoginRoute());
              },
              child: const Text('Çıkış Yap'),
            ),
            ElevatedButton(
              onPressed: () async {
                await context.pushRoute(const ProfileRoute());
              },
              child: const Text('profile gidiş'),
            ),
          ],
        ),
      ),
    );
  }
}
