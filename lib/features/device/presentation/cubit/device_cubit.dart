import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/common/base/cubit/base_cubit.dart';
import 'package:reprocare/common/base/cubit/base_state.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/device/domain/entities/request/user_device_request_param/user_device_request_param.dart';
import 'package:reprocare/features/device/domain/entities/response/user_device_entity/user_device_entity.dart';
import 'package:reprocare/features/device/domain/repositories/i_device_repository.dart';
import 'package:reprocare/helper/device/device_info/device_info_helper.dart';

part 'device_state.dart';
part 'device_cubit.freezed.dart';

class DeviceCubit extends Cubit<DeviceState> with BaseCubit<DeviceState> {
  DeviceCubit(this._deviceRepository, this._deviceInfoHelper)
      : super(DeviceState.initial());

  final IDeviceRepository _deviceRepository;
  final DeviceInfoHelper _deviceInfoHelper;
  List<UserDeviceEntity>? userDeviceList;
  UserDeviceEntity? currentUserDevice;

  @override
  Future<void> initialize() async {}

  Future<void> getUserDeviceList() async {
    safeEmit(DeviceState.loading());

    final response = await _deviceRepository.getUserDeviceList();

    final value = switch (response) {
      Success(value: final List<UserDeviceEntity> _userDeviceListEntity) => {
          userDeviceList = _userDeviceListEntity,
          safeEmit(DeviceState.listSuccess()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(DeviceState.error(exception.message)),
        }
    };
  }

  Future<void> insertUserDevice(
    UserDeviceRequestParam userDeviceRequestParam,
  ) async {
    safeEmit(DeviceState.loading());

    final response =
        await _deviceRepository.insertUserDevice(userDeviceRequestParam);

    final value = switch (response) {
      Success(value: final UserDeviceEntity _userDeviceEntity) => {
          currentUserDevice = _userDeviceEntity,
          safeEmit(DeviceState.insertSuccess()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(DeviceState.error(exception.message)),
        }
    };
  }

  Future<UserDeviceRequestParam> getDeviceInfo() async {
    return await _deviceInfoHelper.getUserDeviceRequest();
  }
}
