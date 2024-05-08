
import 'package:flutter/material.dart';
import 'package:narges_portfolio/core/app_colors.dart';
import 'package:narges_portfolio/core/size_helper.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.onTapItem,
  });
  final Function(int selectedIndex) onTapItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: SizeHelper.isMobile(context) ? 54 : 36, horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.pink600,
      ),
      padding: EdgeInsets.symmetric(
          vertical: SizeHelper.isMobile(context) ? 6 : 4,
          horizontal: SizeHelper.isMobile(context) ? 12 : 28),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _headerItem(context, 'Über', 1, onTapItem),
          const Icon(Icons.circle, color: AppColors.pink700, size: 6),
          _headerItem(context, 'Fähigkeiten', 2, onTapItem),
          const Icon(Icons.circle, color: AppColors.pink700, size: 6),
          _headerItem(context, 'Kontakt', 3, onTapItem),
        ],
      ),
    );
  }

  Widget _headerItem(
      BuildContext context, String label, int i, Function(int index) onTap) {
    return InkWell(
      onTap: () => onTap(i),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeHelper.isMobile(context) ? 20 : 48, vertical: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: SizeHelper.isMobile(context) ? 11.5 : 17,
            color: AppColors.pink700,
            // fontWeight: SizeHelper.isMobile(context)
            //     ? FontWeight.bold
            //     : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
