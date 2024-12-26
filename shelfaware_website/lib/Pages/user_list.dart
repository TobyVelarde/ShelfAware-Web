import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {"userID": "2022011", "username": "Stefan", "inventories": 5},
    {"userID": "2022012", "username": "Anna", "inventories": 3},
    {"userID": "2022013", "username": "John", "inventories": 7},
    {"userID": "2022014", "username": "Doe", "inventories": 2},
     {"userID": "2022014", "username": "Doe", "inventories": 2},
      {"userID": "2022014", "username": "Doe", "inventories": 2},
       {"userID": "2022014", "username": "Doe", "inventories": 2},
        {"userID": "2022014", "username": "Doe", "inventories": 2},
         {"userID": "2022014", "username": "Doe", "inventories": 2},
          {"userID": "2022014", "username": "Doe", "inventories": 2},
           {"userID": "2022014", "username": "Doe", "inventories": 2},
            {"userID": "2022014", "username": "Doe", "inventories": 2},
            
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search bar row
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Dropdown for entries
                DropdownButton<int>(
                  value: 10,
                  dropdownColor: Colors.black,
                  style: const TextStyle(color: Colors.white),
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
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                // Search field
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      hintText: 'Search...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      // Handle search input
                    },
                  ),
                ),
              ],
            ),
          ),
       
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('User ID')),
                    DataColumn(label: Text('Username')),
                    DataColumn(label: Text('No. of Inventories')),
                  ],
                  rows: users.map((user) {
                    return DataRow(
                      cells: [
                        DataCell(Text(user["userID"].toString())),
                        DataCell(Text(user["username"].toString())),
                        DataCell(Text(user["inventories"].toString())),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
