import 'package:flutter/material.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

class DashboardDeviceCard extends StatelessWidget {
  final String deviceName;
  final String lastUpdate;
  final List<DeviceMetric> metrics;

  const DashboardDeviceCard({
    required this.deviceName,
    required this.lastUpdate,
    required this.metrics,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemes.currentTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.grid_view,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          deviceName,
                          style: AppThemes.currentTheme.textTheme.titleMedium
                              ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.more_horiz, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lastUpdate,
                      style:
                          AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
                        color: AppLightColors.secondaryTextColor,
                        fontSize: 11,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.web, size: 16, color: Colors.grey),
                        const SizedBox(width: 8),
                        Icon(Icons.battery_full,
                            size: 16, color: Colors.green.shade400),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Metrics Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: metrics
                    .map((metric) => Expanded(
                          child: _buildMetricItem(metric),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(DeviceMetric metric) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: getMetricColor(metric.type),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            getMetricIcon(metric.type),
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          metric.label,
          style: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: metric.value,
                style:
                    AppThemes.currentTheme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: getMetricColor(metric.type),
                ),
              ),
              if (metric.unit.isNotEmpty)
                TextSpan(
                  text: ' ${metric.unit}',
                  style: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Color getMetricColor(MetricType type) {
    switch (type) {
      case MetricType.temperature:
        return Color(0xFF10B981); // Emerald Green
      case MetricType.pressure:
        return Color(0xFF10B981);
      case MetricType.level:
        return Color(0xFF10B981);
      default:
        return Colors.blue;
    }
  }

  IconData getMetricIcon(MetricType type) {
    switch (type) {
      case MetricType.temperature:
        return Icons.thermostat;
      case MetricType.pressure:
        return Icons.speed;
      case MetricType.level:
        return Icons.water_drop;
      default:
        return Icons.circle;
    }
  }
}

class DeviceMetric {
  final String label;
  final String value;
  final String unit;
  final MetricType type;

  const DeviceMetric({
    required this.label,
    required this.value,
    required this.unit,
    this.type = MetricType.temperature,
  });
}

enum MetricType { temperature, pressure, level, other }
