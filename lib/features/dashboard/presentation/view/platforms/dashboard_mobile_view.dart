import 'package:flutter/material.dart';
import 'package:reprocare/features/dashboard/presentation/widgets/sensor_card.dart';

class DashboardMobileView extends StatelessWidget {
  const DashboardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Center(child: SensorCard()),
        );
      },
    );
  }
}
