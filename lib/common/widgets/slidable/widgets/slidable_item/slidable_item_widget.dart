import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableItemWidget extends StatelessWidget {
  const SlidableItemWidget({
    super.key,
    required this.child,
    required this.onTap,
    required this.boxColor,
    required this.borderRadius,
  });

  final Widget child;
  final Color boxColor;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          Slidable.of(context)?.close();
          onTap();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.w,
          ),
          decoration:
              BoxDecoration(color: boxColor, borderRadius: borderRadius),
          child: child,
        ),
      ),
    );
  }
}
