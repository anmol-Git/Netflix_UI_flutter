import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget dekstop;
  final Widget tablet;

  const Responsive({
    Key key,
    @required this.mobile,
    @required this.dekstop,
    this.tablet,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isDekstop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return dekstop;
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800)
          return tablet ?? mobile;
        else
          return mobile;
      },
    );
  }
}
