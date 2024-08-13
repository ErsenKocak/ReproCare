import 'package:hive/hive.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';
import 'package:reprocare/features/notification_settings/data/services/local/i_notification_settings_local_service.dart';
import 'package:reprocare/features/notification_settings/domain/entities/notification_sound_item/notification_sound_item.dart';

class NotificationSettingsLocalService
    extends INotificationSettingsLocalService {
  NotificationSettingsLocalService() {
    initialize();
  }

  @override
  String get boxName => CacheConstants.NotificationSettings.name;

  @override
  void registerAdapters() {
    Hive.registerAdapter(
      CacheConstants.NotificationSettings.name,
      (json) => NotificationSoundItem.fromJson(json),
    );
  }
}
