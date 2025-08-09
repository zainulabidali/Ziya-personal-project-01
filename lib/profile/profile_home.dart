import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_app/home/widgets/divider.dart';
import 'package:personal_app/profile/Widgets/top_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Profile_top_widget(),
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
