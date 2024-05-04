import 'package:flutter/material.dart';

class SliverFillRemainingWidget extends StatelessWidget {
  const SliverFillRemainingWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[child],
          ),
        ),
      ],
    );
  }
}
