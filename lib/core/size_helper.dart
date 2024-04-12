import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

class SizeHelper {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 576;
}
