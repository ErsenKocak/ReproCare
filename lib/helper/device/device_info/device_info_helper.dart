import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:reprocare/common/logger/app_logger.dart';
import 'package:reprocare/features/device/domain/entities/request/user_device_request_param/user_device_request_param.dart';
import 'package:reprocare/helper/localization/localization_helper.dart';

class DeviceInfoHelper {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Future<BaseDeviceInfo> getDeviceInfo() async {
    var _deviceData;
    if (Platform.isAndroid) {
      _deviceData = await deviceInfoPlugin.androidInfo;

      AppLogger.call(
        title: 'DEVICE INFO -- ANDROID',
        value: (_deviceData as AndroidDeviceInfo).toMap(),
      );
    } else if (Platform.isIOS) {
      _deviceData = await deviceInfoPlugin.iosInfo;
      AppLogger.call(
        title: 'DEVICE INFO -- IOS',
        value: (_deviceData as IosDeviceInfo).toMap(),
      );
    }
    return _deviceData;
  }

  Future<UserDeviceRequestParam> getUserDeviceRequest() async {
    BaseDeviceInfo baseDeviceInfo = await getDeviceInfo();
    UserDeviceRequestParam userDeviceRequestParam = UserDeviceRequestParam();

    if (Platform.isAndroid) {
      userDeviceRequestParam = userDeviceRequestParam.copyWith(
        name: baseDeviceInfo.data['brand'],
        model: baseDeviceInfo.data['model'],
        deviceId: baseDeviceInfo.data['id'],
        physicalDevice: baseDeviceInfo.data['isPhysicalDevice'],
        systemVersion: baseDeviceInfo.data['version']['release'],
        platform: Platform.operatingSystem,
        language:
            AppLocalizationHelper.currentLocale.languageCode.toUpperCase(),
      );
    } else {
      userDeviceRequestParam = userDeviceRequestParam.copyWith(
        name: baseDeviceInfo.data['name'],
        model: baseDeviceInfo.data['model'],
        deviceId: baseDeviceInfo.data['identifierForVendor'],
        physicalDevice:
            baseDeviceInfo.data['isPhysicalDevice'] == 'true' ? true : false,
        systemVersion: baseDeviceInfo.data['systemVersion'],
        platform: Platform.operatingSystem,
        language:
            AppLocalizationHelper.currentLocale.languageCode.toUpperCase(),
      );
    }

    AppLogger.call(
      title: 'UserDeviceRequestParam',
      value: userDeviceRequestParam.toJson(),
    );

    return userDeviceRequestParam;
  }
}
