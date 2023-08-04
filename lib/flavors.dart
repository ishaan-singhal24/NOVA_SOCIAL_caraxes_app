enum Flavor {
  PROD,
  DEV,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'Nova Social';
      case Flavor.DEV:
        return 'Nova Social Dev';
      default:
        return 'title';
    }
  }

}
