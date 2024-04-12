import 'dart:math';

import 'package:flutter/material.dart';
import 'package:narges_portfolio/core/app_colors.dart';
import 'package:narges_portfolio/core/size_helper.dart';
import 'package:narges_portfolio/widgets/header_widget.dart';

class FirstSlide extends StatelessWidget {
  const FirstSlide({
    super.key,
    required this.onTapItem,
  });
  final Function(int selectedIndex) onTapItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: AppColors.pink,
        ),
        Positioned.fill(
          child: Opacity(
            opacity: .6,
            child: Transform.scale(
              scale: 1.7,
              child: Image.asset('assets/pattern1.png'),
            ),
          ),
        ),
        Positioned(
          left: SizeHelper.isMobile(context) ? 30 : 130,
          top: SizeHelper.isMobile(context) ? 120 : 150,
          child: BigIcon(assetPath: 'assets/icon1.png'),
        ),
        Positioned(
          right: 50,
          top: SizeHelper.isMobile(context) ? 280 : 240,
          child: BigIcon(assetPath: 'assets/icon3.png'),
        ),
        Positioned(
          bottom: SizeHelper.isMobile(context) ? 200 : 50,
          right: SizeHelper.isMobile(context) ? 280 : 500,
          child: BigIcon(assetPath: 'assets/icon2.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'Hallo! Ich heiße',
                style: TextStyle(
                  color: AppColors.pink700,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProtestStrike',
                  fontSize: SizeHelper.isMobile(context) ? 44 : 110,
                ),
              ),
              Text(
                'Narges',
                style: TextStyle(
                  color: AppColors.pink700,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProtestStrike',
                  height: 1,
                  fontSize: SizeHelper.isMobile(context) ? 49 : 122,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mobile App Entwicklerin',
                    style: TextStyle(
                      fontFamily: 'ProtestStrike',
                      fontSize: SizeHelper.isMobile(context) ? 15 : 24,
                      color: AppColors.pink700,
                      height: 1.2,
                      letterSpacing: .7,
                      wordSpacing: 2,
                    ),
                  ),
                  SizedBox(),
                  SizedBox(),
                  Text(
                    'N.Y',
                    style: TextStyle(
                      fontFamily: 'ProtestStrike',
                      fontSize: SizeHelper.isMobile(context) ? 15 : 24,
                      fontWeight: FontWeight.w900,
                      color: AppColors.pink700,
                      height: 1.2,
                      letterSpacing: .7,
                      wordSpacing: -4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        HeaderWidget(onTapItem: onTapItem),
      ],
    );
  }
}

class BigIcon extends StatefulWidget {
  final String assetPath;

  const BigIcon({
    super.key,
    required this.assetPath,
  });
  @override
  _BigIconState createState() => _BigIconState();
}

class _BigIconState extends State<BigIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 8 + Random().nextInt(16)),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.pink700
              .withOpacity(SizeHelper.isMobile(context) ? .2 : 1),
          shape: BoxShape.circle,
        ),
        child: Image.asset(widget.assetPath,
            width: (SizeHelper.isMobile(context) ? 40 : 70) +
                Random().nextInt(20) +
                .0),
      ),
      builder: (BuildContext context, Widget? widget) {
        return Transform.rotate(
          angle: _controller.value * 6.28,
          child: widget,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
