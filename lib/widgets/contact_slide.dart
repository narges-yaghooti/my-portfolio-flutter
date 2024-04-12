import 'package:flutter/material.dart';
import 'package:narges_portfolio/core/app_colors.dart';
import 'package:narges_portfolio/core/size_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSlide extends StatelessWidget {
  const ContactSlide({super.key, required this.onTapItem});
  final Function(int selectedIndex) onTapItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: AppColors.cyan,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: .4,
            child: Transform.scale(
              scale: 1.7,
              child: Image.asset('assets/pattern1.png'),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: (SizeHelper.isMobile(context)) ? 2 : 3),
              Text(
                'Kontaktiere mich',
                style: TextStyle(
                  fontFamily: 'ProtestStrike',
                  fontSize: SizeHelper.isMobile(context) ? 40 : 120,
                  fontWeight: FontWeight.w900,
                  color: AppColors.cyan800,
                  height: 1.3,
                  letterSpacing: .7,
                  wordSpacing: -4,
                ),
              ),
              const Spacer(flex: 2),
              _links(context, showNavigation: false),
              const Spacer(),
              Wrap(
                // alignment: WrapAlignment.spaceAround,
                // runAlignment: WrapAlignment.spaceAround,
                crossAxisAlignment: WrapCrossAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.cyan600,
                    radius: SizeHelper.isMobile(context) ? 32 : 50,
                    child: ClipOval(child: Image.asset('assets/prof2.jpeg')),
                    // child: ClipOval(
                    //   child: Image.network(
                    //     'https://media.licdn.com/dms/image/D4D03AQGUEUwbJ7qAng/profile-displayphoto-shrink_400_400/0/1709107755732?e=1714608000&v=beta&t=ZuN7VTLcnWfS9_2szAtvEEG_MYDhfykSk-6tnxbGsQA',
                    //   ),
                    // ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '© Narges Yahouti',
                        style: TextStyle(
                          fontFamily: 'ProtestStrike',
                          fontSize: SizeHelper.isMobile(context) ? 20 : 56,
                          fontWeight: FontWeight.w900,
                          color: AppColors.cyan800,
                          height: 1.2,
                          letterSpacing: .7,
                          wordSpacing: -4,
                        ),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        'Kreative Entwicklerin',
                        style: TextStyle(
                          fontFamily: 'ProtestStrike',
                          fontSize: SizeHelper.isMobile(context) ? 14 : 38,
                          color: AppColors.cyan700.withOpacity(.35),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (SizeHelper.isMobile(context)) const Spacer(),
              _links(context, showContact: false),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ],
    );
  }

  Widget _links(
    BuildContext context, {
    bool showContact = true,
    bool showNavigation = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showNavigation)
          Expanded(
            flex: SizeHelper.isMobile(context) ? 2 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Navigation',
                  style: TextStyle(
                    fontFamily: 'ProtestStrike',
                    fontSize: SizeHelper.isMobile(context) ? 23 : 34,
                    // fontWeight: FontWeight.w900,
                    color: AppColors.cyan700,
                    height: .7,
                    letterSpacing: .7,
                    wordSpacing: -4,
                  ),
                ),
                const Divider(color: AppColors.cyan700),
                const SizedBox(height: 6),
                _navigationLink(context, 'Mich?', 0, onTapItem),
                _navigationLink(context, 'Über', 1, onTapItem),
                _navigationLink(context, 'Fähigkeiten', 2, onTapItem),
              ],
            ),
          ),
        if (showNavigation)
          SizedBox(width: SizeHelper.isMobile(context) ? 14 : 24),
        if (showContact)
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kontakt',
                  style: TextStyle(
                    fontFamily: 'ProtestStrike',
                    fontSize: SizeHelper.isMobile(context) ? 23 : 34,
                    // fontWeight: FontWeight.w900,
                    color: AppColors.cyan700,
                    height: .7,
                    letterSpacing: .7,
                    wordSpacing: -4,
                  ),
                ),
                const Divider(color: AppColors.cyan700),
                const SizedBox(height: 6),
                _contactLink(context, 'LinkedIn',
                    'https://www.linkedin.com/in/narges-yaghouti/'),
                _contactLink(context, 'Telegram', 'https://t.me/nrgs_ygh'),
                _contactLink(context, 'Email',
                    'mailto:narges82apple@gmail.com?subject=opportunity'),
                _contactLink(
                    context, 'Github', 'https://github.com/narges-yaghooti'),
              ],
            ),
          ),
      ],
    );
  }

  Widget _contactLink(BuildContext context, String label, String link) {
    return InkWell(
      onTap: () => _launchUrl(link),
      child: Row(
        children: [
          if (!SizeHelper.isMobile(context)) const SizedBox(width: 12),
          Text(
            '-',
            style: TextStyle(
              fontFamily: 'ProtestStrike',
              fontSize: SizeHelper.isMobile(context) ? 26 : 34,
              // fontWeight: FontWeight.w900,
              color: AppColors.cyan700,
              height: 1.1,
              letterSpacing: .7,
              wordSpacing: -4,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'ProtestStrike',
              fontSize: SizeHelper.isMobile(context) ? 18 : 23,
              color: AppColors.cyan700,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _navigationLink(
      BuildContext context, String label, int i, Function(int index) onTap) {
    return InkWell(
      onTap: () => onTap(i),
      child: Row(
        children: [
          if (!SizeHelper.isMobile(context)) const SizedBox(width: 12),
          Text(
            '-',
            style: TextStyle(
              fontFamily: 'ProtestStrike',
              fontSize: SizeHelper.isMobile(context) ? 26 : 34,
              // fontWeight: FontWeight.w900,
              color: AppColors.cyan700,
              height: 1.1,
              letterSpacing: .7,
              wordSpacing: -4,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'ProtestStrike',
              fontSize: SizeHelper.isMobile(context) ? 18 : 23,
              color: AppColors.cyan700,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
