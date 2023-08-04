import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nova_social/data/models/misc/misc.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/nova_social_app.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/repository/repository.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/routes.dart';
import 'package:nova_social/services/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:nova_social/utils/utils.dart';
import 'flavors.dart';
import 'package:nova_social/data/config/configure_mobile.dart'
    if (dart.library.html) 'package:nova_social/data/config/configure_web.dart';

final GetIt getIt = GetIt.instance;

String getCurrentFlavor() {
  return const String.fromEnvironment("flavor", defaultValue: "dev");
}

FirebaseOptions currentFirebaseWebConfig() {
  String flavor = getCurrentFlavor();
  if (flavor == "prod") {
    return const FirebaseOptions(
      apiKey: "AIzaSyBocXm5oFmmhQO0CKSdyuxFe_jajNlgOok",
      appId: "1:899427589392:web:128815920fd1ea74451995",
      messagingSenderId: "899427589392",
      projectId: "nova-social-b4f05",
      storageBucket: "nova-social-b4f05.appspot.com",
      authDomain: "nova-social-b4f05.firebaseapp.com",
      measurementId: "G-0CH158QBDE",
    );
  }
  return const FirebaseOptions(
    apiKey: "AIzaSyBNah7bECo9KRqbG8fnReZGjz_Iy-pjV7k",
    authDomain: "nova-social---dev.firebaseapp.com",
    projectId: "nova-social---dev",
    storageBucket: "nova-social---dev.appspot.com",
    messagingSenderId: "470634687421",
    appId: "1:470634687421:web:0dc0e5bbf9df9aee3400d4",
    measurementId: "G-NB6PT3RMFE",
  );
}

void setFlavor() {
  String flavor = getCurrentFlavor();
  if (flavor == 'prod') {
    F.appFlavor = Flavor.PROD;
  } else {
    F.appFlavor = Flavor.DEV;
  }
}

void main() async {
  setFlavor();
  WidgetsFlutterBinding.ensureInitialized();
  await _initFirebase();
  // Fix: Hive Initialization
  await _initHive();
  await _registerHiveTypeAdapters();
  await _registerHiveBoxes();
  await _initialize();

  // runZonedGuarded<Future<void>>(
  //   () async {
  //     // Pass all uncaught errors from the framework to Crashlytics.
  //     FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  //     runApp(const NovaSocialApp());
  //   },
  //   FirebaseCrashlytics.instance.recordError,
  // );
  runApp(const NovaSocialApp());
}

Future<void> _initFirebase() async {
  configureApp();
  if (kIsWeb.not) {
    await Firebase.initializeApp();
    return;
  }
  await Firebase.initializeApp(
    name: getCurrentFlavor(),
    options: currentFirebaseWebConfig(),
  );
}

Future<void> _initHive() async {
  if (kIsWeb) {
    Hive.initFlutter();
    return;
  }
  final dir = await getApplicationDocumentsDirectory();
  final path = dir.path;
  HiveEnvironment.dbPath = path;
  Hive.init(path);
  // final Directory downloadsDirectory = await getApplicationDocumentsDirectory();
  // HiveEnvironment.dbPath = downloadsDirectory.path;
  // Hive.initFlutter(HiveEnvironment.dbPath);
  // Hive.initFlutter();
}

Future<void> _registerHiveTypeAdapters() async {
  try {
    // for (var adapter in typeAdapters) {
    //   Hive.registerAdapter(adapter);
    // }
    Hive.registerAdapter(TimestampAdapter());
    Hive.registerAdapter(ColorAdapter());
  } catch (e) {
    Logger.logError('main.dart', e);
  }
}

Future<void> _registerHiveBoxes() async {
  try {
    HiveEnvironment.generalBox =
        await HiveService().openBox(HiveEnvironment.generalBOX);
    HiveEnvironment.generalBox;
  } catch (e) {
    Logger.logError('main.dart', e);
  }
}

Future<void> _initialize() async {
  await _registerRepo();
  await _registerNotifiers();
  AppEnvironment.isMobile
      ? getIt.registerSingleton<MobileRouter>(MobileRouter())
      : getIt.registerSingleton<NovaRouter>(NovaRouter());
  getIt.registerSingleton<FirebaseNotificationService>(
    FirebaseNotificationService(),
  );
}

Future<void> _registerRepo() async {
  getIt.registerSingleton<AuthRepository>(AuthRepository());
  getIt.registerSingleton<OpenAiRepository>(OpenAiRepository());
  getIt.registerSingleton<ProfileRepository>(ProfileRepository());
  getIt.registerSingleton<GlobalRepository>(GlobalRepository());
  getIt.registerSingleton<OnboardingRepository>(OnboardingRepository());
  getIt.registerSingleton<ConfigRepository>(ConfigRepository());

  getIt.registerSingleton<FeedRepository>(FeedRepository());

  getIt.registerSingleton<InternshipRepository>(InternshipRepository());

  getIt.registerSingleton<ChatBotRepository>(ChatBotRepository());

  getIt.registerSingleton<PlaygroundRepository>(PlaygroundRepository());

  getIt.registerSingleton<SearchRepository>(SearchRepository());

  //
  getIt.registerSingleton<HuggingFaceRepository>(HuggingFaceRepository());
  getIt.registerSingleton<ProdiaRepository>(ProdiaRepository());
  getIt.registerSingleton<StableDiffusionApiRepository>(
      StableDiffusionApiRepository());
  getIt.registerSingleton<StabilityAiRepository>(StabilityAiRepository());

  //
  getIt.registerSingleton<NotificationRepository>(NotificationRepository());
  getIt.registerSingleton<ConnectionRepository>(ConnectionRepository());
}

Future<void> _registerNotifiers() async {
  getIt.registerSingleton<AuthNotifier>(
    AuthNotifier.initialize(
      getIt<AuthRepository>(),
    ),
  );

  getIt.registerSingleton<OpenAiNotifier>(
    OpenAiNotifier.initialize(
      getIt<OpenAiRepository>(),
    ),
  );

  getIt.registerSingleton<ProfileNotifier>(
    ProfileNotifier.initialize(
      getIt<ProfileRepository>(),
      globalRepo: getIt<GlobalRepository>(),
      configRepo: getIt<ConfigRepository>(),
      notificationRepo: getIt<NotificationRepository>(),
      connectionRepo: getIt<ConnectionRepository>(),
    ),
  );

  getIt.registerSingleton<OnboardingNotifier>(
    OnboardingNotifier.initialize(
      getIt<OnboardingRepository>(),
    ),
  );

  getIt.registerSingleton<FeedNotifier>(
    FeedNotifier.initialize(
      getIt<FeedRepository>(),
    ),
  );

  getIt.registerSingleton<InternshipNotifier>(
    InternshipNotifier.initialize(
      getIt<InternshipRepository>(),
    ),
  );

  getIt.registerSingleton<ChatBotNotifier>(
    ChatBotNotifier.initialize(
      getIt<ChatBotRepository>(),
    ),
  );

  getIt.registerSingleton<PlaygroundNotifier>(
    PlaygroundNotifier.initialize(
      getIt<PlaygroundRepository>(),
    ),
  );

  getIt.registerSingleton<SearchNotifier>(
    SearchNotifier.initialize(
      getIt<SearchRepository>(),
    ),
  );

  //..
  getIt.registerSingleton<HuggingFaceNotifier>(
    HuggingFaceNotifier.initialize(
      getIt<HuggingFaceRepository>(),
    ),
  );

  getIt.registerSingleton<ProdiaNotifier>(
    ProdiaNotifier.initialize(
      getIt<ProdiaRepository>(),
    ),
  );

  getIt.registerSingleton<StableDiffusionApiNotifier>(
    StableDiffusionApiNotifier.initialize(
      getIt<StableDiffusionApiRepository>(),
    ),
  );

  getIt.registerSingleton<StabilityAiNotifier>(
    StabilityAiNotifier.initialize(
      getIt<StabilityAiRepository>(),
    ),
  );

  getIt.registerSingleton<NotificationNotifier>(
    NotificationNotifier.initialize(
      getIt<NotificationRepository>(),
    ),
  );

  //..
}
