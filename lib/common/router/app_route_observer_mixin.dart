import 'dart:developer';

import 'package:flutter/material.dart';

mixin RouterObserverMixin<T extends StatefulWidget> on State<T>
    implements RouteAware {
  @override
  void initState() {
    log('RouterObserverMixin İnit State');

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appRouteObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }
}

RouteObserver<PageRoute> appRouteObserver = RouteObserver<PageRoute>();
