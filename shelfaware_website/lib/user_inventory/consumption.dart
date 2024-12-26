import 'package:flutter/material.dart';
import 'dart:math';

class ConsumptionPage extends StatelessWidget {
  final Map<String, List<int>> graphData;

  const ConsumptionPage({Key? key, required this.graphData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    int maxQuantity = 0;
    int maxFrequency = 0;

    // Calculate the maximum values for quantity and frequency
    graphData.forEach((_, values) {
      maxQuantity = max(maxQuantity, values[0]);
      maxFrequency = max(maxFrequency, values[1]);
    });

    int maxValue = max(maxQuantity, maxFrequency);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        children: [
          // Quantity graph
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.4),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Quantity Trend',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildBarGraph(graphData, maxValue, 'Quantity', context),
                ],
              ),
            ),
          ),
          
          // Frequency graph
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.4),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Frequency Trend',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildBarGraph(graphData, maxValue, 'Frequency', context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarGraph(Map<String, List<int>> graphData, int maxValue, String type, BuildContext context) {
    double maxBarWidth = MediaQuery.of(context).size.width * 0.3;

    // Sort the entries by value in descending order
    var sortedEntries = graphData.entries.toList()
      ..sort((a, b) => (b.value[type == 'Quantity' ? 0 : 1])
          .compareTo(a.value[type == 'Quantity' ? 0 : 1]));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sortedEntries.map((entry) {
        String itemName = entry.key;
        int value = type == 'Quantity' ? entry.value[0] : entry.value[1];

        // Calculate the bar width relative to the max value (either quantity or frequency)
        double barWidth = (value / maxValue) * maxBarWidth;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              // Item Name
              Text(
                itemName,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              const SizedBox(width: 16), // Adds spacing between the item name and the bar

              // Bar
              Container(
                height: 20,
                width: barWidth,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const Spacer(), // Takes up remaining space

              // Value (fixed on the right)
              Text(
                '$value',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
