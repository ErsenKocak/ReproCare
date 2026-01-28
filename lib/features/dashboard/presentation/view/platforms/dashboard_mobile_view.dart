import 'package:flutter/material.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/features/dashboard/presentation/widgets/dashboard_device_card.dart';
import 'package:reprocare/features/dashboard/presentation/widgets/mobile_dashboard_device_card.dart';

class DashboardMobileView extends StatelessWidget {
  const DashboardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final devices = [
      MobileDashboardDeviceCard(
        deviceName: 'DSO 140',
        lastUpdate: '25.11.2025 - 10:05:50',
        metrics: [
          DeviceMetric(
              label: 'Sıcaklık',
              value: '24',
              unit: '°C',
              type: MetricType.temperature),
        ],
      ),
      MobileDashboardDeviceCard(
        deviceName: 'DSO 130',
        lastUpdate: '25.11.2025 - 10:05:50',
        metrics: [
          DeviceMetric(
              label: 'LN₂ Seviye',
              value: '85',
              unit: '%',
              type: MetricType.level),
          DeviceMetric(
              label: 'Basınç',
              value: '13',
              unit: 'bar',
              type: MetricType.pressure),
        ],
      ),
      MobileDashboardDeviceCard(
        deviceName: 'DSO 110',
        lastUpdate: '25.11.2025 - 10:05:50',
        metrics: [
          DeviceMetric(
              label: 'Sıcaklık A',
              value: '-4',
              unit: '°C',
              type: MetricType.temperature),
          DeviceMetric(
              label: 'Sıcaklık B',
              value: '21',
              unit: '°C',
              type: MetricType.temperature),
          DeviceMetric(
              label: 'LN₂ Seviye',
              value: '450',
              unit: 'mm',
              type: MetricType.level),
          DeviceMetric(
              label: 'Kullanım',
              value: '280',
              unit: 'mm',
              type: MetricType.level),
        ],
      ),
    ];

    return Container(
      color: const Color(0xFFF9FAFB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'İzleme ve Kontrol Paneli',
                  style: AppThemes.currentTheme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Gerçek zamanlı sistem genel bakışı',
                  style: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
                    color: AppLightColors.secondaryTextColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          // Device Cards List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: devices.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return devices[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
