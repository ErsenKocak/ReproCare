import 'package:flutter/material.dart';
import 'package:reprocare/common/widgets/icons/app_icon.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/features/dashboard/presentation/widgets/dashboard_device_card.dart';
import 'package:reprocare/generated/assets.gen.dart';

class MobileDashboardDeviceCard extends StatelessWidget {
  final String deviceName;
  final String lastUpdate;
  final List<DeviceMetric> metrics;

  const MobileDashboardDeviceCard({
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
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 2),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Assets.icons.dashboard.icCardMenu.svg(),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      deviceName,
                      style: AppThemes.currentTheme.textTheme.titleMedium
                          ?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.more_horiz, color: Colors.grey.shade400, size: 20),
              ],
            ),
          ),

          // Date & Status Icons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lastUpdate,
                  style: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
                    color: AppLightColors.secondaryTextColor,
                    fontSize: 10,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.wifi, size: 14, color: Colors.grey.shade400),
                    const SizedBox(width: 6),
                    Icon(Icons.battery_full,
                        size: 14, color: Colors.green.shade400),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Metrics Grid
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: _buildMetricsGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid() {
    // For mobile, we'll arrange metrics in a responsive grid
    // 1 metric: single centered
    // 2 metrics: side by side
    // 3-4 metrics: 2x2 grid

    if (metrics.length == 1) {
      return Center(child: _buildMetricItem(metrics[0], isLarge: true));
    } else if (metrics.length == 2) {
      return Row(
        children: metrics
            .map((metric) => Expanded(
                  child: _buildMetricItem(metric),
                ))
            .toList(),
      );
    } else {
      // 3 or 4 metrics - use grid with LayoutBuilder
      return LayoutBuilder(
        builder: (context, constraints) {
          return Wrap(
            spacing: 12,
            runSpacing: 12,
            children: metrics.map((metric) {
              return SizedBox(
                width: (metrics.length == 3)
                    ? constraints.maxWidth
                    : (constraints.maxWidth - 12) / 2,
                child: _buildMetricItem(metric),
              );
            }).toList(),
          );
        },
      );
    }
  }

  Widget _buildMetricItem(DeviceMetric metric, {bool isLarge = false}) {
    return Container(
      padding: EdgeInsets.all(isLarge ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(isLarge ? 14 : 10),
            decoration: BoxDecoration(
              color: _getMetricColor(metric.type),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              _getMetricIcon(metric.type),
              color: Colors.white,
              size: isLarge ? 28 : 22,
            ),
          ),
          SizedBox(height: isLarge ? 12 : 8),
          Text(
            metric.label,
            style: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: isLarge ? 13 : 11,
              color: Colors.grey.shade700,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: isLarge ? 6 : 4),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: metric.value,
                  style:
                      AppThemes.currentTheme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: isLarge ? 32 : 24,
                    color: _getMetricColor(metric.type),
                    height: 1.2,
                  ),
                ),
                if (metric.unit.isNotEmpty)
                  TextSpan(
                    text: ' ${metric.unit}',
                    style: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: isLarge ? 14 : 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getMetricColor(MetricType type) {
    switch (type) {
      case MetricType.temperature:
        return const Color(0xFF10B981); // Emerald Green
      case MetricType.pressure:
        return const Color(0xFF10B981);
      case MetricType.level:
        return const Color(0xFF10B981);
      default:
        return Colors.blue;
    }
  }

  IconData _getMetricIcon(MetricType type) {
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
