import 'package:flutter/material.dart';
import 'package:personal_app/home/widgets/appbar_widgets.dart';
import 'package:personal_app/home/widgets/home_dashbord.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    HomeDashbord(), // your dashboard widget
    Center(child: Text('History Page')),
    Center(child: Text('Leave Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const Appbar_widgets(),
        body: _pages[_selectedIndex], // switch content here
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: const Color.fromARGB(255, 27, 139, 230),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.table_rows), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.arrow_forward), label: 'Leave'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
