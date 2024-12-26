import 'package:flutter/material.dart';
import 'package:shelfaware_website/Pages/analytics.dart';
import 'package:shelfaware_website/Pages/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppBarPage(),
    );
  }
}

class AppBarPage extends StatefulWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  int currentPage = 0; // Index to track the current page
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
   
    pages = [
      AnalyticsPage(), 
      UserListPage (),
    ];
  }

  // Handle navigation based on index
  void _onNavigationTapped(int index) {
    setState(() {
      currentPage = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFF8F9FB),
          elevation: 0,
          title: Row(
            children: [
              const Icon(Icons.store, color: Colors.black),
              const SizedBox(width: 8),
              const Text(
                'ShelfAware',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              // Navigation buttons
              TextButton(
                onPressed: () => _onNavigationTapped(0), // Dashboard
                child: const Text(
                  'Analytics',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () => _onNavigationTapped(1), // Home
                child: const Text(
                  'User List',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              
              
              
             
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Sign out logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Sign out',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
      body: pages[currentPage], // Render the content based on currentPage index
    );
  }
}
