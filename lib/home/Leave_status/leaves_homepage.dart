import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:personal_app/home/Leave_status/widgets/grid_box.dart';
import 'package:personal_app/home/Leave_status/widgets/leave_calenderwidget.dart';
import 'package:personal_app/home/Leave_status/widgets/leavehistory_table.dart';
import 'package:personal_app/home/Leave_status/widgets/widgets.dart';

class LeavesHomepage extends StatelessWidget {
  LeavesHomepage({super.key});

  final List<Map<String, dynamic>> leaveData = [
    {
      'title': 'Leave Taken',
      'value': '16 days',
      'subtitle': '10 days remaining this Month',
      'icon': Icons.file_copy,
    },
    {
      'title': 'Leave Balance',
      'value': '8 days',
      'subtitle': '29 days remaining this month',
      'icon': Icons.calendar_today,
    },
    {
      'title': 'Pending Request',
      'value': '1 request',
      'subtitle': '29 days remaining this month',
      'icon': Icons.hourglass_bottom,
    },
    {
      'title': 'Approved Leaves',
      'value': '5 leaves',
      'subtitle': '29 days remaining this month',
      'icon': Icons.check_circle,
    },
    {
      'title': 'Rejected Leaves',
      'value': '2 leaves',
      'subtitle': '29 days remaining this month',
      'icon': Icons.cancel,
    },
    {
      'title': 'Upcoming Leaves',
      'value': '1 leave',
      'subtitle': 'Scheduled (25 June)\n',
      'icon': Icons.schedule,
    },
  ];

  final DateTime selectedMonth = DateTime(2025, 6); // June 2025

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
        DateUtils.getDaysInMonth(selectedMonth.year, selectedMonth.month);
    final firstDay = DateTime(selectedMonth.year, selectedMonth.month, 1);
    final startWeekday = firstDay.weekday % 7;
    final totalSlots = daysInMonth + startWeekday;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Bar
              const Padding(
                padding: EdgeInsets.all(16),
                child: leave_widgets_Appbar(),
              ),

              // Grid View
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: leave_grid_box(leaveData: leaveData),
              ),

              const SizedBox(height: 16),

              // Calendar Container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: leave_calender(
                  selectedMonth: selectedMonth,
                  totalSlots: totalSlots,
                  startWeekday: startWeekday,
                ),
              ),

              const SizedBox(height: 16),

              // Leave History Table
              LeaveHistoryTableWidget(),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
