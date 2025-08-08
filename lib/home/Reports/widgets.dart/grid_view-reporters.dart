import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportGrid extends StatelessWidget {
  ReportGrid({super.key});

  final List<Map<String, dynamic>> reportData = [
    {
      'title': 'Total Working \nDays\n(This Month)',
      'value': '22 days',
      'icon': Icons.calendar_month,
    },
    {
      'title': 'Total Hours \nWorked\n',
      'value': '145 hrs',
      'icon': Icons.hourglass_bottom,
    },
    {
      'title': 'Tasks \nCompleted',
      'value': '35',
      'icon': Icons.check_circle_outline,
    },
    {
      'title': 'Average \nDaily Hours',
      'value': '6.6',
      'icon': Icons.alarm,
    },
  ];

  Widget reportCard(String title, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.all(4),  
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 197, 194, 194)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(137, 6, 6, 6),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Icon(icon, color: Colors.lightBlue),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                
              ),
                        const SizedBox(width: 10),

              if (title.contains("Tasks Completed"))
                const Text("this month",
                    style: TextStyle(fontSize: 12, color: Colors.black38)),
              if (title.contains("Average Daily Hours"))
                const Text("hrs/day",
                    style: TextStyle(fontSize: 13, color: Colors.black38)),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: reportData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 1.3, // more compact
      ),
      itemBuilder: (context, index) {
        final data = reportData[index];
        return reportCard(data['title'], data['value'], data['icon']);
      },
    );
  }
}
