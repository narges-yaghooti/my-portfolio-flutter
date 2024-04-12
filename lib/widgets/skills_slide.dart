import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:narges_portfolio/core/app_colors.dart';
import 'package:narges_portfolio/core/size_helper.dart';

class SkillsSlide extends StatelessWidget {
  const SkillsSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppColors.yellow,
      child: SizeHelper.isMobile(context)
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: skillsChildern(context),
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: skillsChildern(context),
            ),
    );
  }

  List<Widget> skillsChildern(BuildContext context) => [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meine Hauptfähigkeiten',
              style: TextStyle(
                fontFamily: 'ProtestStrike',
                fontSize: SizeHelper.isMobile(context) ? 26 : 54,
                // fontWeight: FontWeight.w900,
                color: AppColors.yellow700,
                height: 1.1,
                letterSpacing: .7,
                wordSpacing: -4,
              ),
            ),
            const SizedBox(height: 20),
            _skillItem('Mobile App Entwicklung', context),
            _skillItem('Flutter / Dart', context),
            _skillItem('Git', context),
            const SizedBox(height: 50),
            Text(
              SizeHelper.isMobile(context)
                  ? '* Zurzeit tauche ich tief in die Programmierung\n   ein und lerne neue Dinge.'
                  : '* Zurzeit tauche ich tief in die Programmierung ein und lerne neue Dinge.',
              style: TextStyle(
                fontSize: SizeHelper.isMobile(context) ? 13 : 20,
                color: AppColors.yellow700,
                // height: 1.1,
                // letterSpacing: .7,
                // wordSpacing: -4,
              ),
            ),
          ],
        ),
        SizedBox(
          height: SizeHelper.isMobile(context) ? 12 : 0,
        ),
        SvgPicture.asset(
          'assets/statistics.svg',
          width: 400,
          height: 400,
        ),
      ];

  Widget _skillItem(String title, BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 12),
        Text(
          '-',
          style: TextStyle(
            fontFamily: 'ProtestStrike',
            fontSize: SizeHelper.isMobile(context) ? 24 : 40,
            // fontWeight: FontWeight.w900,
            color: AppColors.yellow700,
            height: 1.1,
            letterSpacing: .7,
            wordSpacing: -4,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'ProtestStrike',
            fontSize: SizeHelper.isMobile(context) ? 18 : 32,
            color: AppColors.yellow700,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
