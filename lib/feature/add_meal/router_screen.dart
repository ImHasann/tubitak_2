import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../product/navigation/app_router.dart';

@RoutePage()
class RouterScreen extends StatelessWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // list of your tab routes
      // routes used here must be declared as children
      // routes of /dashboard
      routes: const [
        LoginRoute(),
        AddMealRoute(),
        HomeRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      builder: (context, child) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key
        return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: const [
                BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.abc)),
                BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.abc)),
                BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.abc)),
              ],
            ),);
      },
    );
  }
}
