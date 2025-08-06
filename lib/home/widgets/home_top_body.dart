import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_app/home/widgets/divider.dart';
import 'package:personal_app/provider.dart';
import 'package:provider/provider.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildGreetingCard(),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('Overview',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOverviewCard("Presence", "20", const Color(0xFF0F7513)),
              _buildOverviewCard("Absence", "03", const Color(0xFFDE645B)),
              _buildOverviewCard("Leave", "02", const Color(0xFFFEB03C)),
            ],
          ),
          const SizedBox(height: 20),
          _buildChips(context),
          const SizedBox(height: 20),
          _buildTask("UI/UX Design Implementation",
              "Translating design specifications into functional and visually appealing user interfaces using technologies like HTML, CSS, and JavaScript."),
          _buildTask("Backend Development",
              "Creating and managing databases for efficient data storage, retrieval and processing."),
          _buildTask("Server-Side Logic",
              "Developing and maintaining the logic that runs on the server, handling user requests, processing data and interacting with databases."),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildGreetingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 251, 251),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 227, 222, 222),
              blurRadius: 1,
              offset: Offset(0, 1))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Good Morning,\nZainul Abid',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 25),
          const Center(
            child: Text(
              "You haven't Punched-in yet",
              style: TextStyle(
                color: Color(0xFFF75D52),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout),
                label: const Text("Punch In"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                ),
              ),
              SizedBox(width: 20.w),
              ElevatedButton.icon(
                onPressed: null,
                icon: const Icon(Icons.logout),
                label: const Text("Punch Out"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildOverviewCard(String label, String value, Color color) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: color.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFECE9E9).withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 13.5.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChips(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildChip(context, Icons.calendar_today, "My Tasks", 0),
        const SizedBox(width: 10),
        _buildChip(context, Icons.timer, "Task Tracker", 1),
        const SizedBox(width: 10),
        _buildChip(context, Icons.loop, "Pending", 2),
      ],
    );
  }

  Widget _buildChip(
      BuildContext context, IconData icon, String label, int index) {
    return Consumer<ChipSelectionProvider>(
      builder: (_, provider, __) {
        bool isSelected = provider.selectedChipIndex == index;

        return OutlinedButton.icon(
          onPressed: () {
            provider.setChipIndex(index);
          },
          icon: Icon(
            icon,
            size: 12,
            color: isSelected ? Colors.blue : Colors.black,
          ),
          label: Text(
            label,
            style: TextStyle(
                color: isSelected ? Colors.blue : Colors.black, fontSize: 12),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: isSelected ? Colors.blue.withOpacity(0.1) : null,
          ),
        );
      },
    );
  }

  Widget _buildTask(String title, String desc) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          // border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("• ", style: TextStyle(fontSize: 16)),
              Expanded(child: Text(desc)),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: const Text('Start'),
              ),
            ),
          ),
          SizedBox(height: 20.h,),
   DashedDivider()
        ],
      ),
    );
  }
}
