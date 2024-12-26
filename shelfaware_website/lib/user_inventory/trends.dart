import 'package:flutter/material.dart';
import 'dart:math';

class TrendsAndAnalyticsWidget extends StatefulWidget {
  final String selectedCategory;
  final Map<String, String> trendsAndAnalytics;

  const TrendsAndAnalyticsWidget({
    Key? key,
    required this.selectedCategory,
    required this.trendsAndAnalytics,
  }) : super(key: key);

  @override
  _TrendsAndAnalyticsWidgetState createState() =>
      _TrendsAndAnalyticsWidgetState();
}

class _TrendsAndAnalyticsWidgetState extends State<TrendsAndAnalyticsWidget> {
  String selectedButton = 'Consumption';

  final Map<String, Map<String, List<int>>> data = {
    'Consumption': {
      'Item 1': [50, 30],
      'Item 2': [40, 20],
      'Item 3': [30, 25],
      'Item 4': [20, 15],
      'Item 5': [60, 50],
      'Item 6': [10, 12],
    },
    'Restocking': {
      'Item 1': [20, 50],
      'Item 2': [10, 60],
      'Item 3': [15, 55],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('Consumption'),
              _buildButton('Restocking'),
              _buildButton('Prices'),
              _buildButton('Total Cost'),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _buildGraphs(),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedButton = label;
        });
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: selectedButton == label
            ? Colors.blueGrey[800]
            : Colors.grey[400],
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      )
    );
  }

  Widget _buildGraphs() {
    if (selectedButton == 'Consumption' || selectedButton == 'Restocking') {
      int maxQuantity = 0;
      int maxFrequency = 0;
      data[selectedButton]!.forEach((_, values) {
        maxQuantity = max(maxQuantity, values[0]);
        maxFrequency = max(maxFrequency, values[1]);
      });

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Trends (${selectedButton})',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...data[selectedButton]!.entries.map(
              (entry) => _buildHorizontalBar(
                entry.key,
                entry.value,
                maxQuantity,
                maxFrequency,
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Text(
          'Select a category to view trends and analytics',
          style: const TextStyle(fontSize: 18),
        ),
      );
    }
  }

  Widget _buildHorizontalBar(
    String itemName,
    List<int> values,
    int maxQuantity,
    int maxFrequency,
  ) {
    double maxBarWidth = MediaQuery.of(context).size.width * 0.6;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemName,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                height: 20,
                width: (values[0] / maxQuantity) * maxBarWidth,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${values[0]}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                height: 20,
                width: (values[1] / maxFrequency) * maxBarWidth,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${values[1]}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
