import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AttendanceChart extends StatelessWidget {
  const AttendanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Attendance",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
      
         
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LegendItem(color: Colors.green, text: 'Present'),
                SizedBox(width: 20),
                LegendItem(color: Colors.red, text: 'Absence'),
                SizedBox(width: 20),
                LegendItem(color: Colors.blue, text: 'Avg hrs'),
              ],
            ),
          
          AspectRatio(
            aspectRatio: 1.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(enabled: false),
                  gridData: FlGridData(show: true, drawVerticalLine: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, _) {
                          const months = [
                            'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                          ];
                          return Text(
                            months[value.toInt()],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          );
                        },
                        interval: 1,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 10,
                  lineBarsData: [
                    // Present (Green)
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                      spots: const [
                        FlSpot(0, 6),
                        FlSpot(1, 7),
                        FlSpot(2, 5),
                        FlSpot(3, 6.5),
                        FlSpot(4, 5.2),
                        FlSpot(5, 6.8),
                        FlSpot(6, 7.3),
                        FlSpot(7, 6.5),
                        FlSpot(8, 7),
                        FlSpot(9, 7.3),
                        FlSpot(10, 7.5),
                        FlSpot(11, 8.2),
                      ],
                    ),
                    // Absence (Red)
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                      spots: const [
                        FlSpot(0, 4),
                        FlSpot(1, 3.5),
                        FlSpot(2, 3),
                        FlSpot(3, 4.2),
                        FlSpot(4, 3.5),
                        FlSpot(5, 2.8),
                        FlSpot(6, 3.4),
                        FlSpot(7, 4.6),
                        FlSpot(8, 3.8),
                        FlSpot(9, 4.5),
                        FlSpot(10, 2.9),
                        FlSpot(11, 3.4),
                      ],
                    ),
                    // Avg hrs (Blue)
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                      spots: const [
                        FlSpot(0, 3.8),
                        FlSpot(1, 5),
                        FlSpot(2, 3.7),
                        FlSpot(3, 4.8),
                        FlSpot(4, 2.9),
                        FlSpot(5, 5),
                        FlSpot(6, 4.9),
                        FlSpot(7, 4.8),
                        FlSpot(8, 5.3),
                        FlSpot(9, 5.6),
                        FlSpot(10, 5.4),
                        FlSpot(11, 5.5),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 14, height: 14, color: color),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}
