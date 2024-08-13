import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_sound_item.freezed.dart';
part 'notification_sound_item.g.dart';

@freezed
class NotificationSoundItem with _$NotificationSoundItem {
  factory NotificationSoundItem({
    required String name,
    required String fileName,
    required String assetPath,
  }) = _NotificationSoundItem;

  factory NotificationSoundItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationSoundItemFromJson(json);
}
