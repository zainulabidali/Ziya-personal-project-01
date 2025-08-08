import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_app/Auth/Login_page/Login_home.dart';
import 'package:personal_app/home/Reports/widgets.dart/attentancechart.dart';
import 'package:personal_app/home/Reports/widgets.dart/grid_view-reporters.dart';
import 'package:personal_app/home/widgets/divider.dart';
import 'package:personal_app/leave/widgets/app_bar_leave_home.dart';

class ReportsHome extends StatelessWidget {
  const ReportsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLeaveHome(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
                SizedBox(
                  width: 10.h,
                ),
                Text("Reports", style: TextStyle(color: Colors.black)),
              ],
            ),
            
            ReportGrid(),
           
            
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Daily Clock-In/Out Log",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 170, 169, 169)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    logHeader(),
                    const DashedDivider(),
                    logRow(
                        "June 21", "09:15 AM", "05:45 PM", "8.5 hrs", "Present"),
                    const DashedDivider(),
                    logRow("June 22", "--", "--", "0 hrs", "Absent"),
                    const DashedDivider(),
                    logRow(
                        "June 23", "09:30 AM", "04:00 PM", "6.5 hrs", "Half Day"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            AttendanceChart(),
          ],
        ),
      ),
    );
  }

  Widget logHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Check-in", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Check-out", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Total Hrs", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Status", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget logRow(
      String date, String checkIn, String checkOut, String hrs, String status) {
    Color statusColor = {
      "Present": Colors.green,
      "Absent": Colors.red,
      "Half Day": Colors.orange,
    }[status]!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(date, style: const TextStyle(fontSize: 14)),
          Text(checkIn, style: const TextStyle(fontSize: 14)),
          Text(checkOut, style: const TextStyle(fontSize: 14)),
          Text(hrs, style: const TextStyle(fontSize: 14)),
          Text(
            status,
            style: TextStyle(
                fontSize: 14, color: statusColor, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  
}
