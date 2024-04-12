import 'package:flutter/material.dart';
import 'package:narges_portfolio/core/app_colors.dart';
import 'package:narges_portfolio/core/size_helper.dart';

class AboutSlide extends StatelessWidget {
  const AboutSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: AppColors.green,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeHelper.isMobile(context) ? 16 : 30),
          child: SizeHelper.isMobile(context)
              ? Column(
                  // alignment: WrapAlignment.center,
                  // runAlignment: WrapAlignment.center,
                  // crossAxisAlignment: WrapCrossAlignment.center,
                  children: _aboutChildren(context),
                )
              : Row(children: _aboutChildren(context)),
        ),
      ],
    );
  }

  Widget _journeyItem(
    BuildContext context, {
    required String title,
    required int year,
    required List<String> items,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              Icon(
                Icons.circle,
                size: SizeHelper.isMobile(context) ? 8 : 14,
                color: AppColors.green700,
              ),
              const VerticalDivider(thickness: 4),
            ],
          ),
          SizedBox(width: SizeHelper.isMobile(context) ? 0 : 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$year',
                style: TextStyle(
                  color: AppColors.green700,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'ProtestStrike',
                  fontSize: SizeHelper.isMobile(context) ? 18 : 23,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.green700.withOpacity(.7),
                  fontWeight: FontWeight.w900,
                  // fontFamily: 'ProtestStrike',
                  fontSize: SizeHelper.isMobile(context) ? 12 : 19,
                ),
              ),
              // const SizedBox(height: 12),
              for (String item in items)
                Text(
                  '- $item',
                  style: TextStyle(
                    color: AppColors.green700,
                    fontSize: SizeHelper.isMobile(context) ? 9 : 12,
                  ),
                  maxLines: 3,
                )
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _aboutChildren(BuildContext context) => [
        Expanded(
          flex: SizeHelper.isMobile(context) ? 2 : 5,
          child: Padding(
            padding:
                EdgeInsets.only(top: SizeHelper.isMobile(context) ? 60 : 0),
            // child: SvgPicture.asset('assets/www1.svg'),
            child: Image.asset('assets/world1.png'),
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeHelper.isMobile(context) ? 4 : 40),
              Text(
                'Meine Reise',
                style: TextStyle( 
                  color: AppColors.green700,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProtestStrike',
                  fontSize: SizeHelper.isMobile(context) ? 30 : 54,
                ),
              ),
              SizedBox(height: SizeHelper.isMobile(context) ? 4 : 32),
              _journeyItem(
                context,
                title: 'Studium der Computertechnik',
                year: 2022,
                items: [
                  'Beginn des Studiums der Computertechnik an\n   der IAU-Universität | Teheran, Iran',
                  'Lernen von C++, C#, Erstellung von Konsolenanwendungen mit C#',
                  'Bestandener Kurs in fortgeschrittener Programmierung mit der Note (19/20)',
                  'Bestandener Kurs in grundlegender Programmierung mit der Note (17/20)',
                ],
              ),
              _journeyItem(
                context,
                title: 'Flutter-Entwickler',
                year: 2023,
                items: [
                  'Beginn des Lernens von Dart & Flutter',
                  'Erstellung einer Medikomment-Anwendung mit Flutter',
                  'Vertiefung in der Softwareentwicklung und Lernen von SQLite, Firebase, etc',
                  'Erstellung meiner persönlichen Website mit Flutter',
                  'Lernen der Programmiersprache Python',
                ],
              ),
              _journeyItem(
                context,
                title: 'Suche nach Ausbildung..',
                year: 2024,
                items: [
                  'Planung, einen Ausbildungsplatz in der IT-Industrie in Deutschland\n   zu erlangen',
                ],
              ),
            ],
          ),
        ),
      ];
}
