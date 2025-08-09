import 'package:flutter/material.dart';
import 'package:personal_app/home/notification/Widgets.dart/items.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.clear),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  const Text(
                    "Notifications",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const NotificationItem(
                    title: "Missed Punch",
                    subtitle:
                        "Missed Clock-in Detected. Please update your attendance or contact HR.",
                    icon: Icons.clear,
                    color: Colors.orange,
                  ),
                  const NotificationItem(
                    title: "Late Attendance",
                    subtitle:
                        "You're running late! Your clock-in time is beyond the scheduled shift start.",
                    icon: Icons.alarm,
                    color: Colors.red,
                  ),
                  const NotificationItem(
                    title: "Daily Summary",
                    subtitle:
                        "Your attendance today: Clock-in at 9:12 AM, Clock-out at 6:05 PM. Total hours: 8.53",
                    icon: Icons.folder_copy_sharp,
                    color: Colors.blue,
                  ),
                  const NotificationItem(
                    title: "Leave Approval",
                    subtitle:
                        "Your leave request for June 15 has been approved. Enjoy your day off!",
                    icon: Icons.verified_outlined,
                    color: Colors.green,
                  ),
                  const NotificationItem(
                    title: "Leave Rejection",
                    subtitle:
                        "Leave request declined. Please check with your manager for details.",
                    icon: Icons.do_not_disturb_on,
                    color: Colors.red,
                  ),
                  const NotificationItem(
                    title: "Shift Update",
                    subtitle:
                        "Shift updated: New shift time is 10:00 AM – 7:00 PM, effective from June 14.",
                    icon: Icons.update,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
