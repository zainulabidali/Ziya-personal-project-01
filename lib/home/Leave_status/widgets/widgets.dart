
import 'package:flutter/material.dart';
import 'package:personal_app/home/widgets/appbar_widgets.dart';

class leave_widgets_Appbar extends StatelessWidget {
  const leave_widgets_Appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/img/usthad.5.jpg'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 249, 248, 248),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 105, 104, 104),
                  blurRadius: 2,
                ),
              ],
            ),
            child: const Row(
              children: [
                Icon(Icons.search, size: 18),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(230, 58, 57, 57),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        notification_icon(),
        const SizedBox(width: 10),
        const CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage('assets/img/usthad.5.jpg'),
        ),
      ],
    );
  }
}
