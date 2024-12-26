import 'package:flutter/material.dart';
import 'package:shelfaware_website/user_inventory/user_profile.dart';

class UserListPage extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {"userID": "2022011", "username": "Stefan", "inventories": 5},
    {"userID": "2022012", "username": "Anna", "inventories": 3},
    {"userID": "2022013", "username": "John", "inventories": 7},
    {"userID": "2022014", "username": "Doe", "inventories": 2},
    // More users...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search bar row
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 16.0), // Reduce vertical padding
            child: Row(
              children: [
                // Dropdown for entries
                DropdownButton<int>(
                  value: 10,
                  dropdownColor: Colors.black,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 14), // Smaller font size
                  items: [10, 25, 50, 100].map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Handle dropdown change
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  "entries",
                  style: TextStyle(
                      color: Colors.white, fontSize: 14), // Smaller font size
                ),
                const Spacer(),
                // Search field
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 36, // Reduce the height of the text field
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search,
                            color: Colors.white, size: 18), // Smaller icon
                        hintText: 'Search...',
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14), // Smaller hint text
                        filled: true,
                        fillColor: Colors.black,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0), // Adjust internal padding
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14), // Smaller input text
                      onChanged: (value) {
                        // Handle search input
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // User list
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  var user = users[index];
                  return UserContainer(
                    userID: user["userID"],
                    username: user["username"],
                    inventories: user["inventories"],
                    onTap: () {
                      // Navigate to UserPage with user data
                      Navigator.push( 
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UsersPage(userName: '', inventories: [],),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for user container design (Horizontal Layout)
class UserContainer extends StatelessWidget {
  final String userID;
  final String username;
  final int inventories;
  final VoidCallback onTap;

  const UserContainer({
    required this.userID,
    required this.username,
    required this.inventories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space items evenly
          children: [
            // User ID
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'User ID',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userID,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            // Username
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  username,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            // No. of Inventories
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'No. of Inventories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  inventories.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Example UserPage, you can customize this based on your needs

