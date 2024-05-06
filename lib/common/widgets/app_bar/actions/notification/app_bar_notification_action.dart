//TODO

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:badges/badges.dart' as badges;

// class AppBarNotificationAction extends StatefulWidget {
//   const AppBarNotificationAction({super.key});

//   @override
//   State<AppBarNotificationAction> createState() =>
//       _AppBarNotificationActionState();
// }

// class _AppBarNotificationActionState extends State<AppBarNotificationAction> {
//   late NotificationCubit notificationCubit;

//   @override
//   void initState() {
//     notificationCubit = ServiceLocatorProvider.provide();
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NotificationCubit, NotificationState>(
//       builder: (context, state) {
//         return badges.Badge(
//           showBadge: notificationCubit.checkForUnReadNotifications,
//           badgeStyle: badges.BadgeStyle(
//             badgeColor: AppLightColors.auxiliaryOrange,
//             padding: EdgeInsets.all(4),
//           ),
//           position: badges.BadgePosition.topEnd(end: 1, top: 1),
//           child: AppSvgPicture(
//             path: Assets.icons.appBar.iconAppBarNotification.path,
//             color: AppThemes.currentTheme.appBarTheme.actionsIconTheme?.color,
//             onTap: () {
//               AppRouter.navigatePushNamed(AppRoutes.Notification.path);
//             },
//           ),
//         );
//       },
//     );
//   }
// }
