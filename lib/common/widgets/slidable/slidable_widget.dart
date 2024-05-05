import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:reprocare/common/functions/app/app_functions.dart';
import 'package:reprocare/common/widgets/slidable/widgets/custom_motion/custom_motion.dart';
import 'package:reprocare/common/widgets/slidable/widgets/slidable_item/slidable_item_widget.dart';

class SlidableWidget extends StatefulWidget {
  const SlidableWidget({
    super.key,
    required this.child,
    required this.slidableKey,
    this.enabled = true,
    this.onOpen,
    this.onClose,
    required this.actionPaneWidgets,
    this.extentRatio = 0.35,
  });

  final Widget child;
  final List<SlidableItemWidget> actionPaneWidgets;
  final String slidableKey;
  final bool? enabled;
  final Function? onOpen;
  final Function? onClose;
  final double? extentRatio;

  @override
  State<SlidableWidget> createState() => _SlidableWidgetState();
}

class _SlidableWidgetState extends State<SlidableWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key('${widget.slidableKey}'),
      enabled: widget.enabled!,
      child: widget.child,
      endActionPane: ActionPane(
        key: Key('${widget.slidableKey}${AppFunctions.randomGuid()}'),
        extentRatio: widget.extentRatio!,
        motion: CustomMotion(
          extentRatio: widget.extentRatio,
          onOpen: widget.onOpen ?? () {},
          onClose: widget.onClose ?? () {},
          motionWidget: DrawerMotion(),
        ),
        children: widget.actionPaneWidgets,
      ),
    );
  }
}
