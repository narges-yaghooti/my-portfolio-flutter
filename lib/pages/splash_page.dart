import 'package:flutter/material.dart';
import 'package:narges_portfolio/core/app_colors.dart';
import 'package:narges_portfolio/core/size_helper.dart';
import 'package:narges_portfolio/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _goToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFD8FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const SizedBox(height: 24),
            Text(
              'Loading ...',
              style: TextStyle(
                fontFamily: 'ProtestStrike',
                fontSize: SizeHelper.isMobile(context) ? 50 : 130,
                color: const Color(0xFF6246EA),
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 12),
            // Text(
            //   'Willkommen auf meiner Website',
            //   style: TextStyle(
            //     fontSize: 21,
            //     color: AppColors.purple700,
            //   ),
            // ),
            const Spacer(),
            const Text(
              '© 2024',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.purple700,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  void _goToHomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => HomePage(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, a, __, c) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = a.drive(tween);
            // return FadeTransition(opacity: 1);
            return SlideTransition(position: offsetAnimation, child: c);
          }),
    );
  }
}
