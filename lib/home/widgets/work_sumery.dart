import 'package:flutter/material.dart';

class Work_summer_dashbord extends StatelessWidget {
  const Work_summer_dashbord({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sort by section
            Row(
              children: [
                const Text(
                  'Sort by:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 15),
                Icon(
                  Icons.circle_outlined,
                  size: 10,
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Deadline',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 15),
                Icon(
                  Icons.circle_outlined,
                  size: 10,
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Project',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  icon: const Icon(Icons.filter_list_outlined),
                  onPressed: () {
                    // Handle icon button press
                  },
                ),
              ],
            ),
            

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 189, 189, 189)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      _buildInfoBox(
                          'Total Working\n Days', '20', Icons.calendar_today),
                      _buildInfoBox(
                          'Avg Daily\n Hours', '8.0', Icons.access_time),
                      _buildInfoBox('Total Hours\n worked', '160', Icons.timer),
                      _buildInfoBox(
                          'Productivity\n indicator', '80%', Icons.bar_chart),
                      _buildInfoBox(
                          'Leave Taken', '2 days', Icons.list_alt_rounded),
                      _buildInfoBox('Projects\n involve', '', Icons.person),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String value, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: Colors.blue),
                SizedBox(width: 6),
                Text(
                  title,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
