import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/web/nova_router.dart';
import 'package:nova_social/routes/routes.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/loading/loading_screen.dart';
import 'package:provider/provider.dart';

class NovaSocialApp extends StatefulWidget {
  const NovaSocialApp({Key? key}) : super(key: key);

  @override
  State<NovaSocialApp> createState() => _NovaSocialAppState();
}

class _NovaSocialAppState extends State<NovaSocialApp>
    with WidgetsBindingObserver {
  final getIt = GetIt.I;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt.allReady(timeout: const Duration(seconds: 3)),
      builder: (context, snap) {
        if (snap.hasData.not) {
          return MaterialApp(
            builder: (context, child) => const LoadingScreen(),
          );
        }
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthNotifier>(
              create: (_) => getIt<AuthNotifier>(),
            ),
            ChangeNotifierProxyProvider<AuthNotifier, ProfileNotifier>(
              create: (context) => getIt<ProfileNotifier>(),
              update: (context, authNoti, previous) {
                return previous!..update(authNoti, previous.authStatus);
              },
            ),
            ChangeNotifierProxyProvider<ProfileNotifier, OnboardingNotifier>(
              create: (context) => getIt<OnboardingNotifier>(),
              update: (context, profileNoti, previous) {
                return previous!..update(profileNoti);
              },
            ),
            ChangeNotifierProxyProvider<ProfileNotifier, FeedNotifier>(
              create: (_) => getIt<FeedNotifier>(),
              update: (context, profileNoti, previous) {
                return previous!..update(profileNoti);
              },
            ),

            ChangeNotifierProxyProvider<ProfileNotifier, ChatBotNotifier>(
              create: (_) => getIt<ChatBotNotifier>(),
              update: (context, chatBotNotifier, previous) {
                return previous!..update(chatBotNotifier);
              },
            ),

            ChangeNotifierProxyProvider<ProfileNotifier, PlaygroundNotifier>(
              create: (_) => getIt<PlaygroundNotifier>(),
              update: (context, profileNoti, previous) {
                return previous!..update(profileNoti);
              },
            ),

            ChangeNotifierProvider<InternshipNotifier>(
              create: (_) => getIt<InternshipNotifier>(),
            ),

            ChangeNotifierProvider<SearchNotifier>(
              create: (_) => getIt<SearchNotifier>(),
            ),

            //..
            ChangeNotifierProvider<OpenAiNotifier>(
              create: (_) => getIt<OpenAiNotifier>(),
            ),
            ChangeNotifierProvider<HuggingFaceNotifier>(
              create: (_) => getIt<HuggingFaceNotifier>(),
            ),
            ChangeNotifierProvider<ProdiaNotifier>(
              create: (_) => getIt<ProdiaNotifier>(),
            ),
            ChangeNotifierProvider<StableDiffusionApiNotifier>(
              create: (_) => getIt<StableDiffusionApiNotifier>(),
            ),
            ChangeNotifierProvider<StabilityAiNotifier>(
              create: (_) => getIt<StabilityAiNotifier>(),
            ),
            //...

            ChangeNotifierProxyProvider<ProfileNotifier, NotificationNotifier>(
              create: (_) => getIt<NotificationNotifier>(),
              update: (context, profileNoti, previous) {
                return previous!..update(profileNoti);
              },
            ),
            //..
          ],
          child: ValueListenableBuilder(
            valueListenable: AppEnvironment.appTheme,
            builder: (_, __, ___) {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarColor: ThemeHandler.backgroundColor(),
                ),
              );
              return MaterialApp.router(
                routerConfig: AppEnvironment.isMobile
                    ? getIt<MobileRouter>().router()
                    : getIt<NovaRouter>().router(),
                color: AppColors.isDark
                    ? AppColors.darkBackground
                    : AppColors.lightBackground,
                builder: (context, child) {
                  final mediaQueryData = MediaQuery.of(context);
                  var ch = MediaQuery(
                    // Set the default textScaleFactor to 1.0 for
                    // the whole subtree.
                    data: mediaQueryData.copyWith(textScaleFactor: 1.0),
                    child: child!,
                  );
                  return ScrollConfiguration(
                    behavior: const ScrollBehaviorImpl(),
                    child: ch,
                  );
                },
                debugShowCheckedModeBanner: false,
                // onGenerateInitialRoutes: (initialRoute) => [
                //   Routes.onGenerateRoute(RouteSettings(name: initialRoute))
                // ],
                // onGenerateRoute: Routes.onGenerateRoute,
                // navigatorKey: AppEnvironment.rootNavigationKey,
                // navigatorObservers: [
                //   AppEnvironment.routeObserver,
                // ],
                theme: themeData,
                // initialRoute: kDebugMode ? Routes.splash ,
                localizationsDelegates: const [
                  MonthYearPickerLocalizations.delegate,
                ],
              );
            },
          ),
        );
      },
    );
  }
}
