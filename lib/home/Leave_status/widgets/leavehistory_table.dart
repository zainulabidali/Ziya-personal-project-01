import 'package:flutter/material.dart';

class LeaveHistoryTableWidget extends StatelessWidget {
  const LeaveHistoryTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 246, 246),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 123, 121, 121).withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Table(
              border: TableBorder.all(
                color: const Color.fromARGB(255, 159, 156, 156),
                width: 1,
                borderRadius: BorderRadius.circular(3),
              ),
              columnWidths: const {
                0: FixedColumnWidth(80),
                1: FixedColumnWidth(100),
                2: FixedColumnWidth(100),
                3: FlexColumnWidth(),
              },
              children: [
                // Table Header
                TableRow(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 254, 254),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
                  ),
                  children: [
                    _buildTableHeaderCell('Date'),
                    _buildTableHeaderCell('Leave Type'),
                    _buildTableHeaderCell('Status'),
                    _buildTableHeaderCell('Reason'),
                  ],
                ),
                // Table Rows
                _buildTableRow('10 June', 'Sick Leave', 'Approved', 'Fever'),
                _buildTableRow('20 June', 'Casual Leave', 'Pending', 'Family Function'),
                _buildTableRow('01 July', 'WFH', 'Rejected', 'No backup'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildTableHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Color.fromARGB(255, 26, 89, 172),
        ),
      ),
    );
  }

  static TableRow _buildTableRow(String date, String leaveType, String status, String reason) {
    Color statusColor;
    switch (status) {
      case 'Approved':
        statusColor = const Color.fromARGB(255, 0, 128, 0); // Darker green
        break;
      case 'Rejected':
        statusColor = const Color.fromARGB(255, 200, 0, 0); // Darker red
        break;
      case 'Pending':
        statusColor = const Color.fromARGB(255, 255, 140, 0); // Orange
        break;
      default:
        statusColor = Colors.grey;
    }

    return TableRow(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      children: [
        _buildTableCell(date),
        _buildTableCell(leaveType),
        _buildTableCell(status, textColor: statusColor),
        _buildTableCell(reason),
      ],
    );
  }

  static Widget _buildTableCell(String text, {Color textColor = const Color.fromARGB(255, 8, 8, 8)}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 13,
        ),
      ),
    );
  }
}