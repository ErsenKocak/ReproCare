import 'package:flutter/material.dart';
import 'package:reprocare/features/dashboard/domain/entities/lab_entity.dart';
import 'package:reprocare/features/dashboard/presentation/widgets/dashboard_device_card.dart';

class DashboardWebView extends StatelessWidget {
  final List<LabEntity> labs;
  final void Function(String deviceId, String sourceLabId, String targetLabId,
      [int? targetIndex]) onDeviceMoved;

  const DashboardWebView({
    required this.labs,
    required this.onDeviceMoved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Content Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 16,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
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
            child: ListView.separated(
              itemCount: labs.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final lab = labs[index];
                return _buildLabSection(lab);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabSection(LabEntity lab) {
    return DragTarget<String>(
      onWillAcceptWithDetails: (details) {
        // Evaluate dragging anything over empty lab space.
        return details.data.contains('|');
      },
      onAcceptWithDetails: (details) {
        final parts = details.data.split('|');
        if (parts.length == 2) {
          final deviceId = parts[0];
          final sourceLabId = parts[1];
          onDeviceMoved(deviceId, sourceLabId, lab.id);
        }
      },
      builder: (context, candidateData, rejectedData) {
        final isHovering = candidateData.isNotEmpty;

        return Container(
          decoration: BoxDecoration(
            color:
                isHovering ? lab.color.withOpacity(0.05) : Colors.transparent,
            border: Border.all(
              color: lab.color,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lab Header
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: lab.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${lab.name} (${lab.devices.length} cihaz)',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Lab Devices
              if (lab.devices.isEmpty)
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text('Bu laboratuvarda cihaz bulunmuyor.',
                      style: TextStyle(color: Colors.grey)),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 420,
                    mainAxisExtent: 260,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                  ),
                  itemCount: lab.devices.length + 1,
                  itemBuilder: (context, deviceIndex) {
                    if (deviceIndex == lab.devices.length) {
                      return DragTarget<String>(
                        onWillAcceptWithDetails: (details) => true,
                        onAcceptWithDetails: (details) {
                          final parts = details.data.split('|');
                          if (parts.length == 2) {
                            final draggedDeviceId = parts[0];
                            final sourceLabId = parts[1];
                            onDeviceMoved(draggedDeviceId, sourceLabId, lab.id,
                                deviceIndex);
                          }
                        },
                        builder: (context, candidateData, rejectedData) {
                          final isHovering = candidateData.isNotEmpty;
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOut,
                                width: isHovering ? 6.0 : 0.0,
                                margin: EdgeInsets.only(
                                    right: isHovering ? 12.0 : 0.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }

                    final device = lab.devices[deviceIndex];
                    final deviceMetrics = device.metrics
                        .map((m) => DeviceMetric(
                              label: m.label,
                              value: m.value,
                              unit: m.unit,
                              type: DeviceMetricType(m.type.name),
                            ))
                        .toList();

                    final card = DashboardDeviceCard(
                      deviceName: device.name,
                      lastUpdate: device.lastUpdate,
                      metrics: deviceMetrics,
                    );

                    return DragTarget<String>(
                      onWillAcceptWithDetails: (details) {
                        return details.data != '${device.id}|${lab.id}';
                      },
                      onAcceptWithDetails: (details) {
                        final parts = details.data.split('|');
                        if (parts.length == 2) {
                          final draggedDeviceId = parts[0];
                          final sourceLabId = parts[1];
                          onDeviceMoved(draggedDeviceId, sourceLabId, lab.id,
                              deviceIndex);
                        }
                      },
                      builder: (context, candidateData, rejectedData) {
                        final isHovering = candidateData.isNotEmpty;

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                              width: isHovering ? 6.0 : 0.0,
                              margin: EdgeInsets.only(
                                  right: isHovering ? 12.0 : 0.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            Expanded(
                              child: LongPressDraggable<String>(
                                data: '${device.id}|${lab.id}',
                                feedback: SizedBox(
                                  width: 420,
                                  height: 260,
                                  child: Opacity(
                                    opacity: 0.8,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: card,
                                    ),
                                  ),
                                ),
                                childWhenDragging: Opacity(
                                  opacity: 0.3,
                                  child: card,
                                ),
                                child: card,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

// Temporary mapping util until DashboardDeviceCard is updated
MetricType DeviceMetricType(String name) {
  switch (name) {
    case 'temperature':
      return MetricType.temperature;
    case 'pressure':
      return MetricType.pressure;
    case 'level':
      return MetricType.level;
    default:
      return MetricType.other;
  }
}
