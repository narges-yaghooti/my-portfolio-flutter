import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:narges_portfolio/core/app_colors.dart';
import 'package:narges_portfolio/widgets/about_slide.dart';
import 'package:narges_portfolio/widgets/first_slide.dart';
import 'package:narges_portfolio/widgets/gif_widget.dart';
import 'package:narges_portfolio/widgets/skills_slide.dart';
import 'package:narges_portfolio/widgets/contact_slide.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: [
          FirstSlide(
            onTapItem: (selectedIndex) => _pageController.animateToPage(
              selectedIndex,
              duration: Duration(milliseconds: 600 + (selectedIndex * 500)),
              curve: Curves.easeOutExpo,
            ),
          ),
          const AboutSlide(),
          const SkillsSlide(),
          ContactSlide(
            onTapItem: (selectedIndex) => _pageController.animateToPage(
              selectedIndex,
              duration: Duration(milliseconds: 600 + (selectedIndex * 500)),
              curve: Curves.easeOutExpo,
            ),
          ),
        ],
      ),
    );
  }
}
