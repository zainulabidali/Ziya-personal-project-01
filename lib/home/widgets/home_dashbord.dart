import 'package:flutter/material.dart';
import 'package:personal_app/home/widgets/body_widgets.dart';

class HomeDashbord extends StatelessWidget {
   HomeDashbord({super.key});

  final List<String> titles = [
    'Attendance',
    'Leaves',
    'Leave Status',
    'Holiday List',
    'Payslip',
    'Reports'
  ];
  final List<IconData> icons = [
    Icons.calendar_month_sharp,
    Icons.logout,
    Icons.pie_chart,
    Icons.list_alt,
    Icons.receipt_long,
    Icons.bar_chart
  ];
  final List<Color> colors = [
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.indigo,
    Colors.green,
    Colors.red
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Dashboard',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: titles.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                return BuildDashboardItem(
                  title: titles[index],
                  icon: icons[index],
                  color: colors[index],
                  index: index + 1,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}