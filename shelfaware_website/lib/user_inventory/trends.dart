import 'package:flutter/material.dart';
import 'package:shelfaware_website/user_inventory/consumption.dart';
import 'package:shelfaware_website/user_inventory/prices_costs.dart';
import 'package:shelfaware_website/user_inventory/restocking.dart';

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
  int selectedIndex = 0;  // Using an index to track the selected category

  final Map<int, String> categories = {
    0: 'Consumption',
    1: 'Restocking',
    2: 'Prices and Total Cost',
  };

  final Map<String, Map<String, List<int>>> data = {
    'Consumption': {
      'Item 1': [14, 30],
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
            children: categories.entries.map((entry) {
              return _buildButton(entry.key, entry.value);
            }).toList(),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _buildPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(int index, String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: selectedIndex == index
            ? Colors.blueGrey[800]
            : Colors.grey[400],
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildPage() {
    switch (selectedIndex) {
      case 0:
        return ConsumptionPage(graphData: data['Consumption']!);
      case 1:
        return RestockingPage(graphData: data['Restocking']!);
      case 2:
        return PricesAndTotalCostPage();
      default:
        return const Center(
          child: Text(
            'Select a category to view trends and analytics',
            style: TextStyle(fontSize: 18),
          ),
        );
    }
  }
}
