import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/common/mapper/api_model_mapper.dart';
import 'package:reprocare/common/network/http_client/http_client_api_url/http_client_end_points.dart';
import 'package:reprocare/common/network/http_client/manager/network_client.dart';
import 'package:reprocare/core/constants/network/http_call_type/http_call_type.dart';
import 'package:reprocare/features/device/data/models/user_device_model/user_device_model.dart';
import 'package:reprocare/features/device/data/services/i_device_service.dart';
import 'package:reprocare/features/device/domain/entities/request/user_device_request_param/user_device_request_param.dart';

final class DeviceService implements IDeviceService {
  final NetworkClient _networkClient;

  DeviceService(this._networkClient);

  @override
  Future<Result<List<UserDeviceModel>, AppException>>
      getUserDeviceList() async {
    return await _networkClient.call(
      path: HttpClientEndPoints.GetAllDevice.URL,
      callType: HttpCallType.GET,
      mapper: (json) => APIModelMapper.jsonToList<UserDeviceModel>(
        json,
        (json) => UserDeviceModel.fromJson(json),
      ),
    );
  }

  @override
  Future<Result<UserDeviceModel, AppException>> insertUserDevice(
    UserDeviceRequestParam userDeviceRequestParam,
  ) async {
    return await _networkClient.call(
      path: HttpClientEndPoints.InsertDevice.URL,
      callType: HttpCallType.POST,
      data: userDeviceRequestParam.toJson(),
      mapper: (json) => UserDeviceModel.fromJson(json),
    );
  }
}
