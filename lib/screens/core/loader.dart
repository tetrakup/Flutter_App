/*import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  loadApp() async {
    final storage = Storage();
    // await storage.clearStorage();
    final firstLaunch = await storage.isFirstLaunch();

    if (firstLaunch) {
      // cihazin gece gunduz moduna erismek
      const darkMode = ThemeMode.system == ThemeMode.dark;

      // cihazin varsayilan diline erismek

      await storage.setConfig(
          language: getDeviceLanguage(), darkMode: darkMode);

      GoRouter.of(context).replace("/onboarding");
    } else {
      // ana ekrana git
      // navigate to home screen

      final config = await storage.getConfig();

      if (config["language"] == null) {
        storage.setConfig(language: getDeviceLanguage());
      }

      if (config["darkMode"] == null) {
        const darkMode = ThemeMode.system == ThemeMode.dark;
        await storage.setConfig(darkMode: darkMode);
      }
      GoRouter.of(context).replace("/homepage");
    }
  }

  getDeviceLanguage() {
    final String defaultLocale;
    if (!kIsWeb) {
      defaultLocale = Platform.localeName;
    } else {
      defaultLocale = "en";
    }
    final langParts = defaultLocale.split("_");
    final supportedLanguages = ["en", "tr", "fr", "es"];

    final String finalLang;

    if (supportedLanguages.contains(langParts[0])) {
      finalLang = langParts[0];
    } else {
      finalLang = "en";
    }

    return finalLang;
  }

  @override
  void initState() {
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
*/
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    super.initState();
    loadApp();
  }

  Future<void> loadApp() async {
    final storage = Storage();
    // await storage.clearStorage(); // Test için kullanabilirsiniz
    final firstLaunch = await storage.isFirstLaunch();

    if (firstLaunch) {
      // Cihazın gece/gündüz moduna ve varsayılan diline erişmek
      final darkMode = ThemeMode.system == ThemeMode.dark;
      final language = getDeviceLanguage();

      // İlk yapılandırmayı kaydet
      await storage.setConfig(language: language, darkMode: darkMode);

      // Onboarding ekranına yönlendir
      GoRouter.of(context).replace("/onboarding");
    } else {
      // Giriş ekranına yönlendir
      GoRouter.of(context).replace("/giris");
    }
  }

  String getDeviceLanguage() {
    final String defaultLocale;
    if (!kIsWeb) {
      defaultLocale = Platform.localeName;
    } else {
      defaultLocale = "en";
    }
    final langParts = defaultLocale.split("_");
    final supportedLanguages = ["en", "tr", "fr", "es"];

    if (supportedLanguages.contains(langParts[0])) {
      return langParts[0];
    } else {
      return "en";
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
 