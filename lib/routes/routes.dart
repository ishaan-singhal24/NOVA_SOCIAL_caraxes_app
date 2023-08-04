export 'web/nova_router.dart';

// import 'package:flutter/material.dart';
// import 'package:nova_social/routes/route_arguments.dart';
// import 'package:nova_social/views/views.dart';

// part 'home_route.dart';
// part 'profile_route.dart';

// class Routes {
//   static String splash = '/splash';
//   static String error404 = '/404';
//   static String currentRoute = '/';

//   static final routes = <String>{
//     splash,
//     ...HomeRoute.homeRoutes,
//     ...ProfileRoute.profileRoutes,
//   };

//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     final args = settings.arguments;

//     currentRoute = settings.name ?? '/';
//     Widget child;
//     if (currentRoute.startsWith(ProfileRoute.userLeading)) {
//       child = ProfileRoute.getPage(currentRoute, args);
//     } else if (currentRoute.startsWith(splash)) {
//       child = const SplashScreen();
//     } else if (currentRoute.startsWith(error404)) {
//       child = const PageNotFoundScreen();
//     } else {
//       child = HomeRoute.getPage(currentRoute, args);
//     }
//     return MaterialPageRoute(
//       builder: (_) => child,
//       settings: settings,
//     );
//   }
// }
