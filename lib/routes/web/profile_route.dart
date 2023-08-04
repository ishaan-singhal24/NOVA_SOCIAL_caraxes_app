// part of 'routes.dart';

// class ProfileRoute {
//   static const userLeading = '/user';
//   static final profileRoutes = <String>{userLeading};

//   static Widget getPage(String currentRoute, Object? args) {
//     Widget child;
//     switch (currentRoute) {
//       case ProfileRoute.userLeading:
//         child = const PageNotFoundScreen();
//         break;
//       default:
//         final urlArgs = currentRoute.split('/');
//         if (urlArgs.length > 3) {
//           child = const PageNotFoundScreen();
//           break;
//         }
//         child = ProfileView(
//           args: ProfileViewArgs(
//             username: urlArgs.last,
//           ),
//         );
//     }
//     return child;
//   }
// }
