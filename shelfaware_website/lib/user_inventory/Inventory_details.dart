// inventory_detail_page.dart
import 'package:flutter/material.dart';
import 'package:shelfaware_website/user_inventory/trends.dart';


class InventoryDetailPage extends StatefulWidget {
  final String inventoryName;

  const InventoryDetailPage({Key? key, required this.inventoryName}) : super(key: key);

  @override
  _InventoryDetailPageState createState() => _InventoryDetailPageState();
}

class _InventoryDetailPageState extends State<InventoryDetailPage> {
  // Track the selected category
  String selectedCategory = '';

  // Dummy categories and trends
  final List<String> categories = [
    'Category 1', 'Category 2', 'Category 3', 'Category 4'
  ];

  final Map<String, String> trendsAndAnalytics = {
    'Category 1': 'Trends and Analytics for Category 1',
    'Category 2': 'Trends and Analytics for Category 2',
    'Category 3': 'Trends and Analytics for Category 3',
    'Category 4': 'Trends and Analytics for Category 4',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.inventoryName} Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Left Column for Categories (small and scrollable)
            Container(
              width: 150, // Fixed width for the category list
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8), // Reduced height to reduce top space
                    // Category List
                    Column(
                      children: categories.map((category) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4.0), // Reduced margin
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[800],
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16), // Space between categories and trends

            // Right Column for Trends and Analytics
            Expanded(
              flex: 2, // Make trends section take more space
              child: TrendsAndAnalyticsWidget(
                selectedCategory: selectedCategory,
                trendsAndAnalytics: trendsAndAnalytics,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
