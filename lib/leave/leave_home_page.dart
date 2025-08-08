import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_app/leave/widgets/app_bar_leave_home.dart';
import 'package:personal_app/leave/widgets/payslip_bottom_widget.dart';
import 'package:personal_app/leave/widgets/top_hedder.dart';

class LeaveHomeScreen extends StatelessWidget {
  const LeaveHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLeaveHome(),
      body: Stack(
        children: [
          // Background watermark image placeholder
          Positioned.fill(
            child: Opacity(
                opacity: 0.09,
                child: Center(
                  child: Image.asset(
                    "assets/img/ziya_logo.png",
                    width: 350,
                    height: 350,
                  ),
                )),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios_new_outlined)),
                        Text(
                          "Pay Slip",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    // Academy Header
                    top_hedding(),
                    SizedBox(height: 10.h),
                    Divider(),
                    SizedBox(height: 10.h),

                    Text(
                      "Employee Summary",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              infoRow("Employee Name", "Abid"),
                              infoRow("Designation", "Flutter Developer"),
                              infoRow("Employee ID", "Employee ID"),
                              infoRow("Date of Joining", "15/07/2025"),
                              infoRow("Pay Period", "July 2025"),
                              infoRow("Pay Date", "15/07/2025"),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(121, 216, 249, 217),
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: const Color.fromARGB(170, 63, 63, 63)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "₹ 45000",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 6, 6, 6),
                                    ),
                                  ),
                                  Text(
                                    "Employee Net Pay",
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.grey),
                                  ),
                                  Divider(),
                                  Text("Paid Days : 31",
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.grey)),
                                  Text("LOP Days : 0",
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.grey)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Divider(),
                    SizedBox(height: 8.h),

                    // PF / UAN
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "PF A/C Number  : AA/AAA/9999 ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(
                          "UAN  : 1111111111",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    // Earnings Table
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: const Color.fromARGB(255, 77, 76, 76)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Table
                          Table(
                            border: TableBorder.all(
                                color: const Color.fromARGB(0, 249, 248, 248)),
                            columnWidths: const {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1.2),
                              2: FlexColumnWidth(1.2),
                              3: FlexColumnWidth(2),
                              4: FlexColumnWidth(1.2),
                              5: FlexColumnWidth(1.2),
                            },
                            children: [
                              tableHeader([
                                "Earnings",
                                "Amount",
                                "YTD",
                                "Deductions",
                                "Amount",
                                "YTD"
                              ]),
                              tableRow([
                                "Basic",
                                "₹ 25000",
                                "₹ 300000",
                                "PF Deduction",
                                "₹ 2500",
                                "₹ 30000"
                              ]),
                              tableRow([
                                "HRA",
                                "₹ 10000",
                                "₹ 120000",
                                "Tax Deduction",
                                "₹ 7500",
                                "₹ 90000"
                              ]),
                              tableRow([
                                "Travel Allowance",
                                "₹ 3000",
                                "₹ 36000",
                                "",
                                "₹ 0",
                                "₹ 0"
                              ]),
                              tableRow([
                                "Meal / Other Allowance",
                                "₹ 2000",
                                "₹ 24000",
                                "",
                                "₹ 0",
                                "₹ 0"
                              ]),
                            ],
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(207, 212, 235, 247),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 12.w),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Gross Earnings ₹ 55000",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  "Total Deductions ₹ 10000",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),
                    // Total Net Payable Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(1.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Net Payable",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 4.h),
                                Text("Gross Earnings - Total Deductions",
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text("₹ 45000",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),

                    PayslipScreen()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow tableHeader(List<String> cells) => TableRow(
        decoration: BoxDecoration(color: Colors.grey.shade300),
        children: cells
            .map((e) => Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Text(
                    e,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                  ),
                ))
            .toList(),
      );

  TableRow tableRow(List<String> cells) => TableRow(
        children: cells
            .map((e) => Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Text(
                    e,
                    style: TextStyle(
                        fontSize: 9.sp,
                        color: const Color.fromARGB(242, 41, 41, 41)),
                  ),
                ))
            .toList(),
      );

  Widget infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Text(
            "$label  : ",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 11, color: const Color.fromARGB(255, 82, 79, 79)),
          ),
        ],
      ),
    );
  }
}
