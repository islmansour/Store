import 'package:flutter/material.dart';
import 'package:store/models/Article.dart';
import 'package:store/ui/SplashScreen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

List<Article> cartArticles = [];
void main() {
  //App Theme Colors
  final theme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Color(0xFFFFB000),
    cursorColor: Color(0xFFFFB000),
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  runApp(new MaterialApp(
    localizationsDelegates: [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      Locale("he", "HE"), // OR Locale('ar', 'AE') OR Other RTL locales
    ],
    locale: Locale("he", "HE"),
    theme: theme,
    title: 'Flutter Store UI',
    home: SplashScreen(),
  ));
}
