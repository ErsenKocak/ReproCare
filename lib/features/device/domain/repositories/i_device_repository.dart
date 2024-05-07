import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/device/domain/entities/request/user_device_request_param/user_device_request_param.dart';
import 'package:reprocare/features/device/domain/entities/response/user_device_entity/user_device_entity.dart';

abstract class IDeviceRepository {
  Future<Result<List<UserDeviceEntity>, AppException>> getUserDeviceList();
  Future<Result<UserDeviceEntity, AppException>> insertUserDevice(
    UserDeviceRequestParam userDeviceRequestParam,
  );
}
