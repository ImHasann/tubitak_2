// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:tubitak_2/feature/Auth/forget_password/forget_password_screen.dart';
import 'package:tubitak_2/feature/Auth/login/login_screen.dart';
import 'package:tubitak_2/feature/Auth/profile/profile_screen.dart';
import 'package:tubitak_2/feature/add_meal/add_meal_screen.dart';
import 'package:tubitak_2/feature/add_meal/router_screen.dart';
import 'package:tubitak_2/feature/home/view/home_screen.dart';
import 'package:tubitak_2/feature/splash/splash_screen.dart';
import 'package:tubitak_2/feature/table%20calender/calender_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: RouterRoute.page, initial: true, children: [
          AutoRoute(
            page: HomeRoute.page,
          ),
          AutoRoute(page: LoginRoute.page),
          AutoRoute(page: ForgotPasswordRoute.page),
          AutoRoute(
            page: SplashRoute.page,
          ),
          AutoRoute(page: ProfileRoute.page),
          AutoRoute(page: CalenderRoute.page),
          AutoRoute(page: AddMealRoute.page),
        ],),
      ];
}
