import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDesktop = kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows;
    final verticalPadding = isDesktop ? 28.0 : 14.0;

    return Container(
      color: const Color(0xFFE8E8E8),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: verticalPadding),
          child: child,
        ),
      ),
    );
  }
}
