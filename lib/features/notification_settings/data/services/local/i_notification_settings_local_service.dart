import 'package:reprocare/core/cache/hive_cache_manager.dart';
import 'package:reprocare/features/notification_settings/domain/entities/notification_sound_item/notification_sound_item.dart';

abstract class INotificationSettingsLocalService
    extends HiveCacheManager<NotificationSoundItem> {}
