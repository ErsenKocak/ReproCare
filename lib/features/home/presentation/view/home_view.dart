import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:reprocare/common/widgets/app_bar/app_bar_widget.dart';
import 'package:reprocare/generated/locale_keys.g.dart';
import 'package:reprocare/helper/notification/local_notification/local_notification_helper.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: Center(
        child: Text(
          'Home View',
          style: TextStyle(color: Colors.red),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.notification_add),
          onPressed: () async {
            await AppLocalNotificationHelper.showLocalNotification(
                title: 'asd', body: 'asdsad');
          }),
    );
  }

  get _buildAppbar {
    return AppBarWidget(
      titleText: LocaleKeys.BottomNavigationBar_Home.tr(),
    );
  }
}
