import 'package:flutter/material.dart';

class ListTileItem {
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final String title;
  final VoidCallback? onTap;

  ListTileItem({
    this.leadingWidget,
    this.trailingWidget,
    required this.title,
    this.onTap,
  });
}
