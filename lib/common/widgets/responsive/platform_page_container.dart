import 'package:flutter/material.dart';
import 'package:reprocare/common/widgets/responsive/responsive_builder.dart';

class PlatformPageContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const PlatformPageContainer({
    super.key,
    required this.child,
    this.maxWidth = 800,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBuilder.isMobile(context)) {
      return child;
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
