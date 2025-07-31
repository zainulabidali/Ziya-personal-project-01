import 'package:flutter/material.dart';
import 'package:personal_app/home/widgets/appbar_widgets.dart';

class LeavesHomepage extends StatelessWidget {
  const LeavesHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Bar: Logo, Search, Notification, Profile
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/img/usthad.5.jpg'),
                ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 105, 104, 104)!,
                      )
                    ],
                    color: const Color.fromARGB(255, 249, 248, 248),
                  ),
                  child: const Row(
                    children: [
                      // Icon(Icons.search, color: Color.fromARGB(255, 233, 231, 231)),
                      SizedBox(width: 8),
                      Expanded(
                          child: Text("Search",
                              style: TextStyle(color: Color.fromARGB(230, 58, 57, 57),
                                  fontSize: 15))),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 40,),
              notification_icon(), const SizedBox(width: 20),
              const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(
                    'assets/img/usthad.5.jpg'), // Replace with your user image
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Leave Summary Grid
          // GridView.count(
          //   crossAxisCount: 2,
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   crossAxisSpacing: 10,
          //   mainAxisSpacing: 10,
          //   childAspectRatio: 1.6,
          //   children: const [
          //     LeaveCard(
          //         title: 'Leave Taken',
          //         value: '16 days',
          //         icon: Icons.receipt_long,
          //         footer: '10 days remaining this Month'),
          //     LeaveCard(
          //         title: 'Leave Balance',
          //         value: '8 days',
          //         icon: Icons.calendar_month,
          //         footer: '29 days remaining this month'),
          //     LeaveCard(
          //         title: 'Pending Request',
          //         value: '1 request',
          //         icon: Icons.hourglass_top,
          //         footer: '29 days remaining this month'),
          //     LeaveCard(
          //         title: 'Approved Leaves',
          //         value: '5 leaves',
          //         icon: Icons.check_circle,
          //         footer: '29 days remaining this month'),
          //     LeaveCard(
          //         title: 'Rejected Leaves',
          //         value: '2 leaves',
          //         icon: Icons.cancel,
          //         footer: '29 days remaining this month'),
          //     LeaveCard(
          //         title: 'Upcoming Leaves',
          //         value: '1 leave\nScheduled (25 June)',
          //         icon: Icons.event,
          //         footer: '29 days remaining this month'),
          //   ],
          // ),
          const SizedBox(height: 20),




          // Calendar Section



          // const Text('June 2025',
          //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          // const SizedBox(height: 10),
          // Table(
          //   border: TableBorder.all(color: Colors.grey[300]!),
          //   children: [
          //     buildWeekRow(['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
          //         isHeader: true),
          //     buildWeekRow(['1', '2', '3', '4', '5', '6', '7'],
          //         highlight: {'3': Colors.green}),
          //     buildWeekRow(['8', '9', '10', '11', '12', '13', '14'],
          //         highlight: {'12': Colors.green}),
          //     buildWeekRow([
          //       '15',
          //       '16',
          //       '17',
          //       '18',
          //       '19',
          //       '20',
          //       '21'
          //     ], highlight: {
          //       '16': Colors.red,
          //       '17': Colors.red,
          //       '20': Colors.yellow,
          //     }),
          //   ],
          // )


        ],
      ),
    );
  }

  TableRow buildWeekRow(List<String> days,
      {bool isHeader = false, Map<String, Color>? highlight}) {
    return TableRow(
      children: days.map((day) {
        final color = isHeader
            ? Colors.black
            : (highlight != null && highlight.containsKey(day)
                ? highlight[day]
                : Colors.transparent);
        return Container(
          padding: const EdgeInsets.all(10),
          color: color,
          alignment: Alignment.center,
          child: Text(
            day,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader || color != Colors.transparent
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class LeaveCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String footer;

  const LeaveCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 4,
            offset: const Offset(2, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Icon(icon, color: Colors.blue),
            ],
          ),
          const SizedBox(height: 8),
          Text(value,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(footer,
              style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
}
