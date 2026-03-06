import 'package:flutter/material.dart';
import 'package:reprocare/features/dashboard/domain/entities/device_entity.dart';

class LabEntity {
  final String id;
  final String name;
  final Color color;
  final List<DeviceEntity> devices;

  LabEntity({
    required this.id,
    required this.name,
    required this.color,
    required this.devices,
  });

  LabEntity copyWith({
    String? id,
    String? name,
    Color? color,
    List<DeviceEntity>? devices,
  }) {
    return LabEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      devices: devices ?? this.devices,
    );
  }
}
