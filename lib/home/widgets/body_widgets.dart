import 'package:flutter/material.dart';
import 'package:personal_app/home/Leave_status/leaves_homepage.dart';
import 'package:personal_app/home/home_screen.dart';

class BuildDashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final int index;

  const BuildDashboardItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
  switch (index) {
    case 0:
      // Navigator.push(context, MaterialPageRoute(builder: (_) => LeavesHomepage()));
      break;
    case 1:
      // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      break;
    case 2:
      // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      break;
    case 3:
      Navigator.push(context, MaterialPageRoute(builder: (_) => LeavesHomepage()));
      break;
    case 4:
      // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      break;
    case 5:
      // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      break;
  }
},


      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: const Color.fromARGB(255, 65, 64, 64).withOpacity(0.2), blurRadius: 4)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}