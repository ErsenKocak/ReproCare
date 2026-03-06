import 'package:reprocare/features/dashboard/domain/entities/device_metric_entity.dart';

class DeviceEntity {
  final String id;
  final String name;
  final String lastUpdate;
  final List<DeviceMetricEntity> metrics;

  DeviceEntity({
    required this.id,
    required this.name,
    required this.lastUpdate,
    required this.metrics,
  });

  DeviceEntity copyWith({
    String? id,
    String? name,
    String? lastUpdate,
    List<DeviceMetricEntity>? metrics,
  }) {
    return DeviceEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      metrics: metrics ?? this.metrics,
    );
  }
}
