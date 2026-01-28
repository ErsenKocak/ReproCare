import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:reprocare/common/cache/cache_manager.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/common/logger/app_logger.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';
import 'package:reprocare/features/notification_settings/domain/entities/notification_sound_item/notification_sound_item.dart';
import 'package:reprocare/features/notification_settings/presentation/view/notification_settings_view.dart';
import 'package:reprocare/features/settings/domain/entities/request/user_settings_request/user_settings_request.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_settings_entity.dart';
import 'package:reprocare/features/settings/presentation/cubit/user_settings_cubit.dart';
import 'package:reprocare/helper/audio/audio_player_helper.dart';

mixin NotificationSettingsMixin<T extends StatefulWidget> on State<T> {
  late UserSettingsCubit userSettingsCubit;
  late AudioPlayerHandler audioPlayerHandler;

  @override
  void initState() {
    super.initState();
    initializeMixin();
  }

  Future<void> initializeMixin() async {
    userSettingsCubit = ServiceLocatorProvider.provide<UserSettingsCubit>();
    audioPlayerHandler = ServiceLocatorProvider.provide<AudioPlayerHandler>();

    userSettingsCubit.initialize();
    _initializeServices();
  }

  Future<void> _initializeServices() async {}

  void changeUserPermissionSettings(UserSettingsEntity settings) {
    settings = settings.copyWith(
        soundName: userSettingsCubit.activeNotificationSound?.fileName);

    userSettingsCubit.changeUserSettings(settings);

    updateUserSettings(UserSettingsRequest(
        isNotificationActive: settings.isNotificationActive,
        soundName: settings.soundName));
  }

  Future<void> updateUserSettings(
      UserSettingsRequest userSettingsRequest) async {
    await userSettingsCubit.updateUserSettings(userSettingsRequest);
  }

  Future<void> onTapNotificationSound(NotificationSoundItem sound) async {
    userSettingsCubit.activeNotificationSound = sound;

    final userSettings =
        userSettingsCubit.userSettings!.copyWith(soundName: sound.fileName);

    userSettingsCubit.changeUserSettings(userSettings);

    userSettingsCubit.saveNotificationSoundToLocalStorage(sound);

    updateUserSettings(UserSettingsRequest(
        isNotificationActive: userSettings.isNotificationActive,
        soundName: userSettings.soundName));
    if (!sound.fileName.contains('default')) {
      await playNotificationSound(sound);
    }
  }

  Future<void> playNotificationSound(NotificationSoundItem sound) async {
    await audioPlayerHandler.setAsset(path: sound.assetPath);
    AudioSource audioSource = AudioSource.asset(sound.assetPath);
    await audioPlayerHandler.setAudioSource(audioSource);
    await audioPlayerHandler.play();
    // audioPlayerHandler.initializeStream();
  }
}
