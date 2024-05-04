import 'package:flutter/material.dart';
import 'package:reprocare/features/profile/presentation/view/profile_view.dart';

mixin ProfileViewMixin on State<ProfileView> {
  @override
  void initState() {
    super.initState();
    initializeMixin();
  }

  Future<void> initializeMixin() async {}
}
