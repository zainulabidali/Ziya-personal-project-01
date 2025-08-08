import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_app/home/widgets/divider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: 120.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/img/bg_pofile.webp'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  const Color.fromARGB(255, 37, 54, 0)
                      .withOpacity(0.5), // 50% opacity
                  BlendMode.darken,
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 0, right: 110),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Zainul Abid',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 89, 175, 245),
                    ),
                  ),
                  Text(
                    'Futter Developer',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(179, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Content overlay
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  // Profile image example
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/img/usthad.5.jpg'), // Example profile image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color.fromARGB(255, 129, 129, 129),
                        width: 1.0,
                      ),
                    ),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(0.2),
                        2: FlexColumnWidth(2),
                      },
                      children: [
                        _buildTableRow('Name', 'Zainul Abid Ali'),
                        _buildDividerRow(),
                        _buildTableRow('Employee ID', 'EMP00321'),
                        _buildDividerRow(),
                        _buildTableRow('Designation', 'Futter Developer'),
                        _buildDividerRow(),
                        _buildTableRow(
                            'Department', 'Software Development Team'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  Center(
                      child: Image.asset(
                    "assets/img/img_progile.png",
                    width: 250,
                    height: 210,
                  )),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 30, 117, 216),
                        minimumSize: const Size(230, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Start work',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// divaider  ///
  TableRow _buildDividerRow() {
    return const TableRow(
      children: [
        DashedDivider(),
        DashedDivider(),
        DashedDivider(),
      ],
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(':'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(value),
        ),
      ],
    );
  }
}
