import 'package:flutter/material.dart';
import 'package:reprocare/features/dashboard/domain/entities/lab_entity.dart';
import 'package:reprocare/features/dashboard/presentation/widgets/dashboard_device_card.dart';
import 'package:reprocare/features/dashboard/presentation/widgets/mobile_dashboard_device_card.dart';

class DashboardMobileView extends StatefulWidget {
  final List<LabEntity> labs;
  final void Function(String deviceId, String sourceLabId, String targetLabId,
      [int? targetIndex]) onDeviceMoved;

  const DashboardMobileView({
    required this.labs,
    required this.onDeviceMoved,
    super.key,
  });

  @override
  State<DashboardMobileView> createState() => _DashboardMobileViewState();
}

class _DashboardMobileViewState extends State<DashboardMobileView> {
  final ScrollController _scrollController = ScrollController();
  bool _isAutoScrolling = false;

  void _startAutoScroll(bool up) async {
    if (_isAutoScrolling) return;
    _isAutoScrolling = true;
    while (_isAutoScrolling) {
      if (!_scrollController.hasClients) break;
      final currentOffset = _scrollController.offset;
      final maxOffset = _scrollController.position.maxScrollExtent;
      final minOffset = _scrollController.position.minScrollExtent;

      double nextOffset = up ? currentOffset - 50 : currentOffset + 50;
      nextOffset = nextOffset.clamp(minOffset, maxOffset);

      if (nextOffset == currentOffset) {
        break;
      }

      await _scrollController.animateTo(
        nextOffset,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  void _stopAutoScroll() {
    _isAutoScrolling = false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9FAFB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: widget.labs.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final lab = widget.labs[index];
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
        return details.data.contains('|');
      },
      onAcceptWithDetails: (details) {
        final parts = details.data.split('|');
        if (parts.length == 2) {
          final deviceId = parts[0];
          final sourceLabId = parts[1];
          widget.onDeviceMoved(deviceId, sourceLabId, lab.id);
        }
        _stopAutoScroll();
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
          padding: const EdgeInsets.all(12),
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
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Lab Devices
              if (lab.devices.isEmpty)
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: const Text('Cihaz yok',
                      style: TextStyle(color: Colors.grey)),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lab.devices.length + 1,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, deviceIndex) {
                    if (deviceIndex == lab.devices.length) {
                      return DragTarget<String>(
                        onWillAcceptWithDetails: (details) => true,
                        onAcceptWithDetails: (details) {
                          final parts = details.data.split('|');
                          if (parts.length == 2) {
                            final draggedDeviceId = parts[0];
                            final sourceLabId = parts[1];
                            widget.onDeviceMoved(draggedDeviceId, sourceLabId,
                                lab.id, deviceIndex);
                          }
                        },
                        builder: (context, candidateData, rejectedData) {
                          final isHovering = candidateData.isNotEmpty;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOut,
                                height: isHovering ? 6.0 : 0.0,
                                margin: EdgeInsets.only(
                                    bottom: isHovering ? 12.0 : 0.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              Container(
                                height: 40,
                                color: Colors.transparent,
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

                    final card = MobileDashboardDeviceCard(
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
                          widget.onDeviceMoved(draggedDeviceId, sourceLabId,
                              lab.id, deviceIndex);
                        }
                      },
                      builder: (context, candidateData, rejectedData) {
                        final isHovering = candidateData.isNotEmpty;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                              height: isHovering ? 6.0 : 0.0,
                              margin: EdgeInsets.only(
                                  bottom: isHovering ? 12.0 : 0.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            LongPressDraggable<String>(
                              data: '${device.id}|${lab.id}',
                              feedback: SizedBox(
                                width: 300,
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
                              onDragUpdate: (details) {
                                final dy = details.globalPosition.dy;
                                final screenHeight =
                                    MediaQuery.of(context).size.height;
                                if (dy < 150) {
                                  _startAutoScroll(true);
                                } else if (dy > screenHeight - 150) {
                                  _startAutoScroll(false);
                                } else {
                                  _stopAutoScroll();
                                }
                              },
                              onDragEnd: (_) => _stopAutoScroll(),
                              onDraggableCanceled: (_, __) => _stopAutoScroll(),
                              child: card,
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
