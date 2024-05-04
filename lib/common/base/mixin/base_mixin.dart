import 'package:flutter/material.dart';

abstract class BaseMixin<T extends StatefulWidget> {
  Future<void> initializeMixin() async {}

  Future<void> disposeMixin() async {}
}
