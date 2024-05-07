import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/device/data/models/user_device_model/user_device_model.dart';
import 'package:reprocare/features/device/domain/entities/request/user_device_request_param/user_device_request_param.dart';

abstract class IDeviceService {
  Future<Result<List<UserDeviceModel>, AppException>> getUserDeviceList();
  Future<Result<UserDeviceModel, AppException>> insertUserDevice(
    UserDeviceRequestParam userDeviceRequestParam,
  );
}
