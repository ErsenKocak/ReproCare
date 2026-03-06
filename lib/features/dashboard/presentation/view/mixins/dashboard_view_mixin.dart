import 'package:flutter/material.dart';
import 'package:reprocare/features/dashboard/domain/entities/device_entity.dart';
import 'package:reprocare/features/dashboard/domain/entities/device_metric_entity.dart';
import 'package:reprocare/features/dashboard/domain/entities/lab_entity.dart';
import 'package:reprocare/features/dashboard/presentation/view/dashboard_view.dart';

mixin DashboardViewMixin on State<DashboardView> {
  late List<LabEntity> labs;

  @override
  void initState() {
    super.initState();
    _initializeLabs();
  }

  void _initializeLabs() {
    labs = [
      LabEntity(
        id: 'lab_1',
        name: 'Laboratuvar 1',
        color: const Color(0xFF10B981), // Green
        devices: [
          DeviceEntity(
            id: 'dev_1',
            name: 'DSO 140',
            lastUpdate: '25.11.2025 - 10:05:50',
            metrics: [
              const DeviceMetricEntity(
                  label: 'Sıcaklık',
                  value: '24',
                  unit: '°C',
                  type: MetricType.temperature),
            ],
          ),
          DeviceEntity(
            id: 'dev_2',
            name: 'DSO 130',
            lastUpdate: '25.11.2025 - 10:05:50',
            metrics: [
              const DeviceMetricEntity(
                  label: 'LN₂ Seviye',
                  value: '85',
                  unit: '%',
                  type: MetricType.level),
              const DeviceMetricEntity(
                  label: 'Basınç',
                  value: '13',
                  unit: 'bar',
                  type: MetricType.pressure),
            ],
          ),
          DeviceEntity(
            id: 'dev_3',
            name: 'DSO 110',
            lastUpdate: '25.11.2025 - 10:05:50',
            metrics: [
              const DeviceMetricEntity(
                  label: 'Sıcaklık A',
                  value: '-4',
                  unit: '°C',
                  type: MetricType.temperature),
              const DeviceMetricEntity(
                  label: 'Sıcaklık B',
                  value: '21',
                  unit: '°C',
                  type: MetricType.temperature),
              const DeviceMetricEntity(
                  label: 'LN₂ Seviye',
                  value: '450',
                  unit: 'mm',
                  type: MetricType.level),
              const DeviceMetricEntity(
                  label: 'Kullanım',
                  value: '280',
                  unit: 'mm',
                  type: MetricType.level),
            ],
          ),
        ],
      ),
      LabEntity(
        id: 'lab_2',
        name: 'Laboratuvar 2',
        color: const Color(0xFFF97316), // Orange
        devices: [
          DeviceEntity(
            id: 'dev_4',
            name: 'DSO 110',
            lastUpdate: '25.11.2025 - 10:05:50',
            metrics: [
              const DeviceMetricEntity(
                  label: 'Sıcaklık A',
                  value: '-4',
                  unit: '°C',
                  type: MetricType.temperature),
              const DeviceMetricEntity(
                  label: 'Sıcaklık B',
                  value: '21',
                  unit: '°C',
                  type: MetricType.temperature),
              const DeviceMetricEntity(
                  label: 'LN₂ Seviye',
                  value: '450',
                  unit: 'mm',
                  type: MetricType.level),
              const DeviceMetricEntity(
                  label: 'Kullanım',
                  value: '280',
                  unit: 'mm',
                  type: MetricType.level),
            ],
          ),
        ],
      ),
      LabEntity(
        id: 'lab_3',
        name: 'Laboratuvar 3',
        color: const Color(0xFF8B5CF6), // Purple
        devices: [
          DeviceEntity(
            id: 'dev_5',
            name: 'DSO 130',
            lastUpdate: '26.11.2025 - 10:05:50',
            metrics: [
              const DeviceMetricEntity(
                  label: 'LN₂ Seviye',
                  value: '85',
                  unit: '%',
                  type: MetricType.level),
              const DeviceMetricEntity(
                  label: 'Basınç',
                  value: '13',
                  unit: 'bar',
                  type: MetricType.pressure),
            ],
          ),
        ],
      ),
    ];
  }

  void onDeviceMoved(String deviceId, String sourceLabId, String targetLabId,
      [int? targetIndex]) {
    setState(() {
      final sourceLabIndex = labs.indexWhere((l) => l.id == sourceLabId);
      final targetLabIndex = labs.indexWhere((l) => l.id == targetLabId);

      if (sourceLabIndex != -1 && targetLabIndex != -1) {
        final device =
            labs[sourceLabIndex].devices.firstWhere((d) => d.id == deviceId);

        final sourceDevices =
            List<DeviceEntity>.from(labs[sourceLabIndex].devices);
        final targetDevices = sourceLabId == targetLabId
            ? sourceDevices
            : List<DeviceEntity>.from(labs[targetLabIndex].devices);

        // Remove from source
        sourceDevices.removeWhere((d) => d.id == deviceId);

        // Insert to target
        if (targetIndex != null) {
          int finalIndex = targetIndex;
          if (finalIndex > targetDevices.length) {
            finalIndex = targetDevices.length;
          }
          targetDevices.insert(finalIndex, device);
        } else {
          targetDevices.add(device);
        }

        labs[sourceLabIndex] =
            labs[sourceLabIndex].copyWith(devices: sourceDevices);
        if (sourceLabId != targetLabId) {
          labs[targetLabIndex] =
              labs[targetLabIndex].copyWith(devices: targetDevices);
        }
      }
    });
  }
}
