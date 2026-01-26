import 'package:flutter/material.dart';
import 'package:reprocare/features/dashboard/presentation/widgets/sensor_card.dart';

class DashboardWebView extends StatelessWidget {
  const DashboardWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sidebar Placeholder
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Sidebar Area',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        // Content Area
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'İzleme ve Kontrol Paneli',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const Center(child: SensorCard());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
