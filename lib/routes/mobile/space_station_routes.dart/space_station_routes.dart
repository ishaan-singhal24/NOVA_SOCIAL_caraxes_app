import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/views/mobile_view/mobile_view.dart';
import 'package:nova_social/views/mobile_view/space_station/pages/export.dart';

final _spaceStationShellNavigatorKey = GlobalKey<NavigatorState>();

class SpaceStationRouter {
  static String spaceStationRoute = '/space-station';
  static String floatingIslandRoute = '/floating-island';

  static List<RouteBase> spaceStationRoutes = [
    ShellRoute(
      navigatorKey: _spaceStationShellNavigatorKey,
      builder: (context, state, child) {
        return SpaceStationMView(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: spaceStationRoute,
          name: spaceStationRoute,
          parentNavigatorKey: _spaceStationShellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: Scaffold(
                body: Center(
                  child: PlanetsMPage(),
                ),
              ),
            );
          },
        ),
        GoRoute(
          path: floatingIslandRoute,
          name: floatingIslandRoute,
          parentNavigatorKey: _spaceStationShellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: Scaffold(
                body: Center(
                  child: FloatingIslandPage(),
                ),
              ),
            );
          },
        ),
      ],
    ),
  ];
}
