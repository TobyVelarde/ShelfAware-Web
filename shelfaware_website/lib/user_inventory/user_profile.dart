import 'package:flutter/material.dart';
import 'package:shelfaware_website/user_inventory/Inventory_details.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key, required String userName, required List inventories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fake data for user name and inventories
    String userName = 'John Doe';
    List<String> inventories = [
      'Inventory A',
      'Inventory B',
      'Inventory C',
      'Inventory D',
      'Inventory E',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label and User Name Display
            Text(
              'User Name: $userName',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              userName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // List of Inventories
            Text(
              'Inventories:',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: inventories.length,
                itemBuilder: (context, index) {
                  return buildBox(context, inventories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Refined buildBox widget for each inventory
  Widget buildBox(BuildContext context, String inventoryName) {
    return GestureDetector(
      onTap: () {
        // Navigate to the InventoryDetailPage when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InventoryDetailPage(inventoryName: inventoryName),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.inventory,
              color: Colors.green[400],
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                inventoryName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

