import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_task/core/utils/context_less_navigation.dart';
import 'package:job_task/core/widgets/scaffold_navbar/scaffold_with_navbar.dart';
import 'package:job_task/ui/views/activity/activity_view.dart';
import 'package:job_task/ui/views/add_activity/add_activity_view.dart';
import 'package:job_task/ui/views/home/home_view.dart';
import 'package:job_task/ui/views/other/other_view.dart';
import 'package:job_task/ui/views/profile/profile_view.dart';

class Routes {
  Routes._();

  static const home = '/home';
  static const activity = '/activity';
  static const addActivity = '/add-activity';
  static const other = '/other';
  static const profile = '/profile';
}

final _shellNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter goRouter = GoRouter(
  navigatorKey: ContextLess.navigatorkey,
  initialLocation: Routes.home,
  errorPageBuilder: (context, state) => const MaterialPage(
    child: Scaffold(
      body: Center(
        child: Text("Invalid Route"),
      ),
    ),
  ),
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: ScaffoldWithNavbar(
          child: child,
        ),
      ),
      routes: [
        GoRoute(
          path: Routes.home,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeView(),
          ),
        ),
        GoRoute(
          path: Routes.activity,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ActivityView(),
          ),
        ),
        GoRoute(
          path: Routes.other,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: OtherView(),
          ),
        ),
        GoRoute(
          path: Routes.profile,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProfileView(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: Routes.addActivity,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AddActivityView(),
      ),
    )
  ],
);
