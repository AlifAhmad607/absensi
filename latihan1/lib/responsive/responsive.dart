import 'package:flutter/material.dart';

class Responsive {
  // ukuran layar
  static Size size(BuildContext context) =>
      MediaQuery.of(context).size;

  static double width(BuildContext context) =>
      size(context).width;

  static double height(BuildContext context) =>
      size(context).height;

  // breakpoint
  static bool isMobile(BuildContext context) =>
      width(context) < 600;

  static bool isTablet(BuildContext context) =>
      width(context) >= 600 && width(context) < 1024;

  static bool isDesktop(BuildContext context) =>
      width(context) >= 1024;
}
