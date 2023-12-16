// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:tubitak_2/feature/home/view/home_screen.dart';
import 'package:tubitak_2/feature/login/login_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
      ];
}
