import 'package:flutter/material.dart';

class PricesAndTotalCostPage extends StatelessWidget {
  // Fake data for testing, no need to pass it from outside
  final Map<String, List<int>> graphData = {
    'Item 1': [25, 10],
    'Item 2': [40, 5],
    'Item 3': [30, 7],
    'Item 4': [15, 12],
    'Item 5': [50, 3],
  };

  PricesAndTotalCostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sort the graphData by price in descending order
    var sortedData = graphData.entries.toList()
      ..sort((a, b) => b.value[0].compareTo(a.value[0])); // Sorting by price in descending order

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Prices List
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Prices',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ..._buildPriceList(sortedData), // Pass the sorted data here
                ],
              ),
            ),
          ),

          // Right: Total Costs List
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Costs',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ..._buildTotalCostList(sortedData), // Pass the sorted data here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPriceList(List<MapEntry<String, List<int>>> sortedData) {
    List<Widget> priceList = [];
    sortedData.forEach((entry) {
      String itemName = entry.key;
      List<int> values = entry.value;

      priceList.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(
              itemName,
              style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7)),
            ),
            const Spacer(),
            Text(
              '\$${values[0]}', // Price
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ));
    });
    return priceList;
  }

  List<Widget> _buildTotalCostList(List<MapEntry<String, List<int>>> sortedData) {
    List<Widget> totalCostList = [];
    int totalCost = 0;

    // Calculate total cost by summing up all items' prices
    sortedData.forEach((entry) {
      totalCost += entry.value[0]; // Sum up the prices
    });

    // Display the total cost value
    totalCostList.add(Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            'Total Cost',
            style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7)),
          ),
          const Spacer(),
          Text(
            '\$${totalCost}', // Total cost
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));

    // Now add individual item total costs
    sortedData.forEach((entry) {
      String itemName = entry.key;
      List<int> values = entry.value;

      totalCostList.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(
              itemName,
              style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7)),
            ),
            const Spacer(),
            Text(
              '\$${values[0]}', // Cost for each item
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ));
    });

    return totalCostList;
  }
}
