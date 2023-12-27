// ignore_for_file: public_member_api_docs, use_if_null_to_convert_nulls_to_bools

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tubitak_2/feature/Auth/forget_password/forget_password_screen.dart';
import 'package:tubitak_2/feature/Auth/login/login_screen.dart';
import 'package:tubitak_2/feature/Auth/profile/profile_screen.dart';
import 'package:tubitak_2/feature/add_meal/add_meal_screen.dart';
import 'package:tubitak_2/feature/home/view/home_screen.dart';
import 'package:tubitak_2/feature/splash/splash_screen.dart';
import 'package:tubitak_2/feature/table%20calender/calender_screen.dart';
import 'package:tubitak_2/product/navigation/auth_guard.dart';
import 'package:tubitak_2/product/navigation/router.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/dashboard',
          initial: true,
          guards: [AuthGuard()],
          page: RouteRoute.page,
          children: [
            AutoRoute(
              path: 'profie',
              page: ProfileRoute.page,
              guards: [AuthGuard()],
            ),
            AutoRoute(
              path: 'profie',
              page: HomeRoute.page,
              guards: [AuthGuard()],
            ),
            AutoRoute(
              path: 'addmeal',
              page: AddMealRoute.page,
              guards: [AuthGuard()],
            ),
          ],
        ),
        AutoRoute(path: '/login', page: LoginRoute.page),
      ];
}
