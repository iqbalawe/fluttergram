import 'package:flutter/material.dart';

import 'package:instagram_clone/utils/utils.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({
    Key? key,
    required this.webScrenLayout,
    required this.mobileScrenLayout,
  }) : super(key: key);

  final Widget webScrenLayout;
  final Widget mobileScrenLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          // web screen
          return webScrenLayout;
        }
        // mobile screen
        return mobileScrenLayout;
      },
    );
  }
}
