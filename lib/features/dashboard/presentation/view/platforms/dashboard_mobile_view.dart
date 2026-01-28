import 'package:flutter/material.dart';
import 'package:reprocare/features/dashboard/presentation/widgets/dashboard_device_card.dart';

class DashboardMobileView extends StatelessWidget {
  const DashboardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data (Same as Web for consistency)
    final devices = [
      DashboardDeviceCard(
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
      DashboardDeviceCard(
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
      DashboardDeviceCard(
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

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: devices.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return devices[index];
      },
    );
  }
}
