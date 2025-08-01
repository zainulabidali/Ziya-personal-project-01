
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class leave_calender extends StatelessWidget {
  const leave_calender({
    super.key,
    required this.selectedMonth,
    required this.totalSlots,
    required this.startWeekday,
  });
  

  final DateTime selectedMonth;
  final int totalSlots;
  final int startWeekday;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day Headers
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Sun', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
              Text('Mon', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Tue', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Wed', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Thu', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Fri', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Sat', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
    
          // Month Name
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              DateFormat('MMMM yyyy').format(selectedMonth),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
    
          
          const SizedBox(height: 10),
    
          // Calendar Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalSlots,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              if (index < startWeekday) return const SizedBox();
    
              final day = index - startWeekday + 1;
    
              // Highlight logic
              Color bgColor = Colors.white;
              if ([3, 12].contains(day)) {
                bgColor = Colors.green.shade300;
              } else if ([16, 17].contains(day)) {
                bgColor = Colors.red.shade300;
              } else if (day == 20) {
                bgColor = Colors.yellow.shade300;
              }
    
              return Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$day',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
