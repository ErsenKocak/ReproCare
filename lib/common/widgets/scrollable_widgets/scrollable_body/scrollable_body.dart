import 'package:flutter/material.dart';

class ScrollableBody extends StatelessWidget {
  ScrollableBody({super.key, required this.body, this.withoutExpandedWidget});

  final Widget body;
  final Widget? withoutExpandedWidget;

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Widget get _body {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [body],
          ),
        ),
        _withoutExpandedWidget,
      ],
    );
  }

  Widget get _withoutExpandedWidget {
    return withoutExpandedWidget ?? const SizedBox();
  }
}
