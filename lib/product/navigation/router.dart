// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tubitak_2/product/navigation/app_router.dart';
import 'package:tubitak_2/product/utility/constants/color_constants.dart';

@RoutePage()
class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        AddMealRoute(),
        ProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.house_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Add',
                icon: Icon(Icons.add),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person_2_outlined),
              ),
            ],
            selectedItemColor: ColorConstants.primaryColor,
          ),
        );
      },
    );
  }
}
