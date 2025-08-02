import 'package:flutter/material.dart';
import 'package:personal_app/const.dart';

class leave_grid_box extends StatelessWidget {
  const leave_grid_box({
    super.key,
    required this.leaveData,
  });

  final List<Map<String, dynamic>> leaveData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: leaveData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1, 
      ),
      itemBuilder: (context, index) {
        final item = leaveData[index];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                
                  Flexible(
                    child: Text(
                      item['title'],
                      style: Kleave_grid_box_tittel,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    item['icon'],
                    size: 24,
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                item['value'] ?? '',
                style: Kleave_grid_box_value,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text(
                item['subtitle'] ?? '',
                style: Kleave_grid_box_subtittel,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
