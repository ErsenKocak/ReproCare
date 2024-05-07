import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/device/data/models/user_device_model/user_device_model.dart';
import 'package:reprocare/features/device/data/services/i_device_service.dart';
import 'package:reprocare/features/device/domain/entities/request/user_device_request_param/user_device_request_param.dart';
import 'package:reprocare/features/device/domain/entities/response/user_device_entity/user_device_entity.dart';
import 'package:reprocare/features/device/domain/repositories/i_device_repository.dart';

final class DeviceRepository implements IDeviceRepository {
  final IDeviceService _deviceService;

  DeviceRepository(this._deviceService);

  @override
  Future<Result<List<UserDeviceEntity>, AppException>>
      getUserDeviceList() async {
    final response = await _deviceService.getUserDeviceList();

    return switch (response) {
      Success(value: final List<UserDeviceModel> _deviceList) => Success(
          _deviceList
              .map((e) => UserDeviceEntity.fromJson(e.toJson()))
              .toList(),
        ),
      Failure(exception: final AppException exception) => Failure(exception)
    };
  }

  @override
  Future<Result<UserDeviceEntity, AppException>> insertUserDevice(
    UserDeviceRequestParam userDeviceRequestParam,
  ) async {
    final response =
        await _deviceService.insertUserDevice(userDeviceRequestParam);

    return switch (response) {
      Success(value: final UserDeviceModel _deviceModel) =>
        Success(UserDeviceEntity.fromJson(_deviceModel.toJson())),
      Failure(exception: final AppException exception) => Failure(exception)
    };
  }
}
