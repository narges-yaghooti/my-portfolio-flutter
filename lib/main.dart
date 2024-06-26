import 'package:flutter/material.dart';
import 'package:narges_portfolio/pages/home_page.dart';
import 'package:narges_portfolio/pages/splash_page.dart';
// import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Narges Yaghouti',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: MediaQuery.withClampedTextScaling(
        /* Sets the minimum and maximum text scaling property to still look adequate */
        minScaleFactor: 1,
        maxScaleFactor: 1,
        child: const SplashPage(),
      ),
      // home: SplashPage(),
    );
  }
}
