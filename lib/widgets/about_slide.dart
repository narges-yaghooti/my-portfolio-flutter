import 'dart:math';

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
              horizontal: SizeHelper.isMobile(context) ? 20 : 30),
          child: SizeHelper.isMobile(context)
              ? Stack(
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
    required List<String> items, //tozihat
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
                  fontSize: SizeHelper.isMobile(context) ? 19 : 26,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.green700,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'ProtestStrike',
                  fontSize: SizeHelper.isMobile(context) ? 18 : 19,
                ),
              ),
              const SizedBox(height: 4),
              // const SizedBox(height: 12),
              for (String item in items)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.greenAccent.shade700,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item,
                      style: TextStyle(
                        color: AppColors.green700,
                        fontSize: SizeHelper.isMobile(context) ? 16 : 14,
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _aboutChildren(BuildContext context) {
    return [
      Expanded(
        flex: SizeHelper.isMobile(context) ? 2 : 5,
        child: Padding(
          padding: EdgeInsets.only(top: SizeHelper.isMobile(context) ? 130 : 0),
          // child: SvgPicture.asset('assets/www1.svg'),
          child: Transform.scale(
            scale: SizeHelper.isMobile(context) ? 1.9 : 1.55,
            child: Image.asset(
              'assets/world1.png',
              color: SizeHelper.isMobile(context)
                  ? const Color.fromARGB(79, 158, 158, 158)
                  : Colors.greenAccent.shade700,
            ),
          ),
        ),
      ),
      const SizedBox(width: 50),
      Expanded(
        flex: 6,
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
                fontSize: SizeHelper.isMobile(context) ? 27 : 50,
              ),
            ),
            SizedBox(height: SizeHelper.isMobile(context) ? 4 : 32),
            _journeyItem(
              context,
              title: 'Studium der Computertechnik',
              year: 2022,
              items: SizeHelper.isMobile(context)
                  ? [
                      'Beginn des Studiums der Computertechnik an\nder IAU-Universität | Teheran, Iran',
                      'Lernen von C++, C#, Erstellung von\nKonsolenanwendungen mit C#',
                      'Bestandener Kurs in fortgeschrittener\nProgrammierung mit der Note (19/20)',
                      'Bestandener Kurs in grundlegender\nProgrammierung mit der Note (17/20)',
                    ]
                  : [
                      'Beginn des Studiums der Computertechnik an der IAU-Universität | Teheran, Iran',
                      'Lernen von C++, C#, Erstellung von Konsolenanwendungen mit C#',
                      'Bestandener Kurs in fortgeschrittener Programmierung mit der Note (19/20)',
                      'Bestandener Kurs in grundlegender Programmierung mit der Note (17/20)',
                    ],
            ),
            _journeyItem(context,
                title: 'Flutter-Entwickler',
                year: 2023,
                items: SizeHelper.isMobile(context)
                    ? [
                        'Beginn des Lernens von Dart & Flutter',
                        'Erstellung einer Medikomment-Anwendung\nmit Flutter',
                        'Vertiefung in der Softwareentwicklung und\nLernen von SQLite, Firebase, etc',
                        'Erstellung meiner persönlichen Website\nmit Flutter',
                        'Lernen der Programmiersprache Python',
                      ]
                    : [
                        'Beginn des Lernens von Dart & Flutter',
                        'Erstellung einer Medikomment-Anwendung mit Flutter',
                        'Vertiefung in der Softwareentwicklung und Lernen von SQLite, Firebase, etc',
                        'Erstellung meiner persönlichen Website mit Flutter',
                        'Lernen der Programmiersprache Python',
                      ]),
            _journeyItem(
              context,
              title: 'Suche nach Ausbildung..',
              year: 2024,
              items: SizeHelper.isMobile(context)
                  ? [
                      'Planung, einen Ausbildungsplatz in der\nIT-Industrie in Deutschland zu erlangen',
                    ]
                  : [
                      'Planung, einen Ausbildungsplatz in der IT-Industrie in Deutschland zu erlangen',
                    ],
            ),
          ],
        ),
      ),
    ];
  }
}
