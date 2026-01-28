import 'package:flutter/material.dart';
import 'package:reprocare/features/dashboard/presentation/widgets/dashboard_device_card.dart';

class DashboardWebView extends StatelessWidget {
  const DashboardWebView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
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

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Content Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'İzleme ve Kontrol Paneli',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Text(
                      'Gerçek zamanlı sistem genel bakışı',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cihaz arama...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.6,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              itemCount: devices.length,
              itemBuilder: (context, index) => devices[index],
            ),
          ),
        ],
      ),
    );
  }
}
