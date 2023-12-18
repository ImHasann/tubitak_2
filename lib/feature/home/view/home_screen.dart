// ignore_for_file: public_member_api_docs, avoid_unnecessary_containers

import 'package:auto_route/auto_route.dart';
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
          ],
        ),
      ),
    );
  }
}
