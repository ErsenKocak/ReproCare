import 'package:flutter/material.dart';
import 'package:reprocare/common/functions/date/date_functions.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/enums/date/date_format_types.dart';
import 'package:reprocare/features/notification/domain/entities/response/notification_model/notification_entity.dart';

class WebNotificationItemWidget extends StatelessWidget {
  final NotificationEntity notification;
  final VoidCallback? onRead;
  final VoidCallback? onDelete;

  const WebNotificationItemWidget({
    required this.notification,
    this.onRead,
    this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Generate a color based on notification content or random consistency
    final color = _getNotificationColor(notification.id ?? 0);
    final icon = _getNotificationIcon(notification.id ?? 0);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notification.isRead == false
            ? Colors.blue.withOpacity(0.02)
            : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: AppThemes.currentTheme.dividerColor.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Circle
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        notification.messageTitle ?? 'Notification',
                        style: AppThemes.currentTheme.textTheme.bodyMedium
                            ?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    if (onDelete != null)
                      IconButton(
                        icon: const Icon(Icons.close,
                            size: 18, color: Colors.grey),
                        onPressed: onDelete,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  notification.messageBody ?? '',
                  style: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  DateFunctions.dateFormat(
                          dateTime: DateFunctions.stringToDateTime(
                              stringDate: notification.createdDate),
                          dateFormat: DateFormatTypes.ddMMyyyyHHmm) ??
                      '',
                  style: AppThemes.currentTheme.textTheme.labelSmall?.copyWith(
                    color: Colors.grey[400],
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getNotificationColor(int id) {
    final colors = [
      Colors.purple,
      Colors.blue,
      Colors.pink,
      Colors.orange,
      Colors.green,
    ];
    return colors[id % colors.length];
  }

  IconData _getNotificationIcon(int id) {
    final icons = [
      Icons.card_giftcard,
      Icons.percent,
      Icons.person_outline,
      Icons.check_circle_outline,
      Icons.schedule,
    ];
    return icons[id % icons.length];
  }
}
