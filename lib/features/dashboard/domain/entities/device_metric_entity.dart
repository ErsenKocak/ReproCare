enum MetricType { temperature, pressure, level, other }

class DeviceMetricEntity {
  final String label;
  final String value;
  final String unit;
  final MetricType type;

  const DeviceMetricEntity({
    required this.label,
    required this.value,
    required this.unit,
    this.type = MetricType.temperature,
  });
}
