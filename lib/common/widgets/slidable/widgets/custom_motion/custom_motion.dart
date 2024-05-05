import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomMotion extends StatefulWidget {
  const CustomMotion({
    Key? key,
    required this.onOpen,
    required this.onClose,
    required this.motionWidget,
    this.extentRatio,
  }) : super(key: key);

  final Function onOpen;
  final Function onClose;
  final Widget motionWidget;
  final double? extentRatio;

  @override
  _CustomMotionState createState() => _CustomMotionState();
}

class _CustomMotionState extends State<CustomMotion> {
  late SlidableController? controller;

  bool isClosed = true;

  animationListener() {
    if ((controller?.ratio == controller?.startActionPaneExtentRatio) &&
        isClosed) {
      isClosed = true;
      widget.onClose();
    }
    if (controller?.ratio == (-(widget.extentRatio ?? 0.35))) {
      widget.onOpen();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = Slidable.of(context);
    controller?.animation.addListener(animationListener);
  }

  @override
  void dispose() {
    controller?.animation.removeListener(animationListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.motionWidget;
  }
}
