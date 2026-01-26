import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/common/base/cubit/base_cubit.dart';
import 'package:reprocare/common/base/cubit/base_state.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/common/cache/cache_manager.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';
import 'package:reprocare/features/notification_settings/domain/entities/notification_sound_item/notification_sound_item.dart';

import 'package:reprocare/features/settings/domain/entities/request/user_settings_request/user_settings_request.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_settings_entity.dart';
import 'package:reprocare/features/settings/domain/repositories/i_user_settings_repository.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:collection/collection.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

part 'user_settings_state.dart';
part 'user_settings_cubit.freezed.dart';

class UserSettingsCubit extends Cubit<UserSettingsState>
    with BaseCubit<UserSettingsState> {
  UserSettingsCubit(this._userSettingsRepository, this.cacheManager)
      : super(UserSettingsState.initial());
  final IUserSettingsRepository _userSettingsRepository;
  CacheManager cacheManager;
  UserSettingsEntity? userSettings;
  late List<NotificationSoundItem> notificationSounds;
  NotificationSoundItem? activeNotificationSound;

  @override
  Future<void> initialize() async {
    userSettings = null;
    safeEmit(UserSettingsState.initial());
    notificationSounds = [
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.alarm,
        name: 'Alarm',
        fileName: 'alarm.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.arpeggio,
        name: 'Arpeggio',
        fileName: 'arpeggio.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.azure,
        name: 'Azure',
        fileName: 'azure.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.chocolate,
        name: 'Chocolate',
        fileName: 'chocolate.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.crystal,
        name: 'Crystal',
        fileName: 'crystal.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.crystalDrop1,
        name: 'Crystal_Drop',
        fileName: 'crystal_drop.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.dontpanic,
        name: 'Dont Panic',
        fileName: 'dontpanic.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.echo,
        name: 'Echo',
        fileName: 'echo.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.girtab,
        name: 'Girtab',
        fileName: 'girtab.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.harmonics,
        name: 'Harmonics',
        fileName: 'harmonics.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.heaven,
        name: 'Heaven',
        fileName: 'heaven.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.insertcoin,
        name: 'InsertCoin',
        fileName: 'insertcoin.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.jump,
        name: 'Jump',
        fileName: 'jump.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.luna,
        name: 'Luna',
        fileName: 'luna.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.magenta,
        name: 'Magenta',
        fileName: 'magenta.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.naughty,
        name: 'Naughty',
        fileName: 'naughty.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.orchid,
        name: 'Orchid',
        fileName: 'orchid.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.regalia,
        name: 'Regalia',
        fileName: 'regalia.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.run,
        name: 'Run',
        fileName: 'run.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.sTicketyTock,
        name: 'S_Tickety_Tock',
        fileName: 's_tickety_tock.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.schedule,
        name: 'Schedule',
        fileName: 'schedule.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.violet,
        name: 'Violet',
        fileName: 'violet.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.viridian,
        name: 'Viridian',
        fileName: 'viridian.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.woodpecker,
        name: 'Woodpecker',
        fileName: 'woodpecker.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.arrived,
        name: 'Arrived',
        fileName: 'arrived.wav',
      ),
      NotificationSoundItem(
        assetPath: Assets.sounds.notification.pixiedust,
        name: 'Pixiedust',
        fileName: 'pixiedust.wav',
      ),
    ];
    notificationSounds.sort(
      (a, b) => a.name.compareTo(b.name),
    );
    notificationSounds.insert(0, getDefaultNotificationSound);
    activeNotificationSound = await getNotificationSoundFromLocalStorage();
    await getUserSettings();
  }

  void changeUserSettings(UserSettingsEntity settings) {
    userSettings = settings;
    safeEmit(UserSettingsState.success());
  }

  Future<void> getUserSettings() async {
    safeEmit(UserSettingsState.loading());
    final response = await _userSettingsRepository.getUserSettings();

    final value = switch (response) {
      Success(value: final UserSettingsEntity _userSettingsEntityResponse) => {
          userSettings = _userSettingsEntityResponse,
          activeNotificationSound =
              getNotificationSoundByName(userSettings?.soundName),
          saveNotificationSoundToLocalStorage(activeNotificationSound!),
          safeEmit(UserSettingsState.success()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(UserSettingsState.error(exception.message)),
          showErrorBottomSheet(exceptionMessage: exception.message),
        }
    };
  }

  Future<void> updateUserSettings(
      UserSettingsRequest userSettingsRequest) async {
    safeEmit(UserSettingsState.loading());
    final response =
        await _userSettingsRepository.updateUserSettings(userSettingsRequest);

    final value = switch (response) {
      Success(value: final UserSettingsEntity _userSettingsEntityResponse) => {
          userSettings = _userSettingsEntityResponse,
          safeEmit(UserSettingsState.success()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(UserSettingsState.error(exception.message)),
          showErrorBottomSheet(exceptionMessage: exception.message),
        }
    };
  }

  NotificationSoundItem getNotificationSoundByName(String? name) =>
      notificationSounds.firstWhereOrNull((sound) => sound.fileName == name) ??
      getDefaultNotificationSound;

  NotificationSoundItem get getDefaultNotificationSound =>
      NotificationSoundItem(
          assetPath: Assets.sounds.notification.arpeggio,
          name: LocaleKeys.Notification_UseDeviceSound.tr(),
          fileName: 'default');

  Future<NotificationSoundItem?> getNotificationSoundFromLocalStorage() async {
    NotificationSoundItem? notificationSound = await cacheManager.getObject(
        CacheConstants.NotificationSettings.name,
        NotificationSoundItem.fromJson);

    return notificationSound;
  }

  void saveNotificationSoundToLocalStorage(
      NotificationSoundItem notificationSoundItem) {
    cacheManager.setObject(
        CacheConstants.NotificationSettings.name, notificationSoundItem);
  }

  emitState() => safeEmit(UserSettingsState.success());
}
