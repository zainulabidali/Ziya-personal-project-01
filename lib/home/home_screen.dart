import 'package:flutter/material.dart';
import 'package:personal_app/home/widgets/appbar_widgets.dart';
import 'package:personal_app/home/widgets/home_dashbord.dart';
import 'package:personal_app/leave/leave_home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages
  final List<Widget> _pages = [
     HomeDashbord(), // Home (Dashboard)
    const Center(child: Text('History Page')), // History tab
    const LeaveHomeScreen(), // Leave page
    const Center(child: Text('Profile Page')), // Profile tab
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _selectedIndex == 0 ? const Appbar_widgets() : null,
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: const Color.fromARGB(255, 1, 96, 174),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.view_list_outlined), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.arrow_forward_outlined), label: 'Leave'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
