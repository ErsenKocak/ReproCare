import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/app_bar/app_bar_widget.dart';
import 'package:reprocare/common/widgets/responsive/platform_page_container.dart';
import 'package:reprocare/common/widgets/responsive/responsive_builder.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/features/notification/presentation/mixin/notifications_view_mixin.dart';
import 'package:reprocare/features/notification/presentation/widgets/notification_list_widget.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView>
    with NotificationViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }

  PreferredSizeWidget? get _buildAppbar {
    // On Web, we might hide the AppBar if we have a Card header,
    // or keep it but make it cleaner.
    // However, ResponsiveBuilder is inside body, so AppBar is shared.
    // For Web "Card design", usually we want the title INSIDE the card, not on the scaffold.
    // But let's check ResponsiveBuilder allows removing AppBar?
    // The Scaffold wraps everything.
    // If I want no AppBar on Web, I need to make _buildAppbar conditional or
    // move Scaffold inside the layouts (which duplicates Scaffold).
    // Simple approach: Use ResponsiveBuilder at the root of build, returning Scaffolds.

    return ResponsiveBuilder.isWeb(context)
        ? null
        : AppBarWidget(
            titleWidget: Column(
              children: [
                Text(
                  LocaleKeys.Notification_Notifications.tr(),
                  style: AppThemes.currentTheme.textTheme.bodyLarge?.copyWith(
                    fontWeight: AppFontWeight.medium.value,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          );
  }

  Widget get _buildBody {
    return ResponsiveBuilder(
      mobile: _buildMobileLayout,
      web: _buildWebLayout,
    );
  }

  Widget get _buildWebLayout {
    return Center(
      child: Container(
        width: 600,
        height: 800,
        margin: const EdgeInsets.symmetric(vertical: 32),
        decoration: BoxDecoration(
          color: AppThemes.currentTheme.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 20,
            ),
          ],
          border: Border.all(
            color: AppThemes.currentTheme.dividerColor.withOpacity(0.5),
          ),
        ),
        child: Column(
          children: [
            // Web Card Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.Notification_Notifications.tr(),
                    style: AppThemes.currentTheme.textTheme.headlineSmall
                        ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      // Mark all read logic if available
                    },
                    icon: const Icon(Icons.done_all, size: 18),
                    label: Text('Mark all as read'), // Localize if possible
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Content
            Expanded(
              child: NotificationListWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildMobileLayout {
    return PlatformPageContainer(child: NotificationListWidget());
  }
}
