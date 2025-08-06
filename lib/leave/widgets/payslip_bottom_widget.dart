import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_app/leave/widgets/download_payslip.dart';

class PayslipScreen extends StatelessWidget {
  const PayslipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),

          // Amount in Words
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Amount in Words: ",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              Text("Rupees Forty Five Thousand\n Only",
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
            ],
          ),
          SizedBox(height: 12.h),

          Divider(height: 24.h),

          Text("This is a system generated payslip, signature not required.",
              style: TextStyle(fontSize: 10.sp, color: Colors.grey)),

          SizedBox(height: 20.h),

          // Download Button
          SizedBox(
            width: double.infinity,
            height: 45.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 22, 118, 197),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrintPreviewScreen()),
                );
              },
              child: Text(
                "Download Payslip",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),

          SizedBox(height: 30.h),

          Text("Monthly Payslip History",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),

          SizedBox(height: 10.h),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: const Color.fromARGB(255, 113, 109, 109)),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      Expanded(child: Text("Month", style: _headerTextStyle())),
                      Expanded(
                          child: Text("Net Pay", style: _headerTextStyle())),
                      Expanded(
                          child: Text("Status:", style: _headerTextStyle())),
                      Expanded(
                          child: Text("Action", style: _headerTextStyle())),
                    ],
                  ),
                ),
                _payslipRow("June 2025", "₹45000"),
                _payslipRow("May 2025", "₹45000"),
                _payslipRow("April 2025", "₹43500"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _payslipRow(String month, String netPay) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      margin: EdgeInsets.only(bottom: 6.h),
      decoration: BoxDecoration(
        color: month == "June 2025"
            ? Colors.blue.withOpacity(0.05)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          Expanded(child: Text(month, style: _rowTextStyle())),
          Expanded(child: Text(netPay, style: _rowTextStyle())),
          Expanded(
              child: Row(
            children: [
              Text("✅Generated", style: _rowTextStyle()),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Text("📥Download",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline)),
            ],
          )),
        ],
      ),
    );
  }

  TextStyle _headerTextStyle() {
    return TextStyle(
        fontSize: 13.sp, fontWeight: FontWeight.bold, color: Colors.black);
  }

  TextStyle _rowTextStyle() {
    return TextStyle(
        fontSize: 12.sp, color: const Color.fromARGB(255, 34, 34, 34));
  }
}
