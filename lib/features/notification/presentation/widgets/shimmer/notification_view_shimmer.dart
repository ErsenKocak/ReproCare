import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/shimmer/shimmer_generated/shimmer_generated.dart';
import 'package:reprocare/common/widgets/shimmer/shimmer_text/shimmer_text.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';

class NotificationViewShimmer extends StatelessWidget {
  const NotificationViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AppShimmerGenerated(
        borderRadius: 12,
        height: 100.sh,
        child: ListView.builder(
          itemCount: 20,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _shimmerCard,
        ),
      ),
    );
  }

  Widget get _shimmerCard {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        AppShimmerText(
          maxLine: 1,
          width: 0.50.sw,
        ),
        AppShimmerText(
          maxLine: 3,
        ),
        20.h.sbxh,
      ],
    );
  }
}
