
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile_top_widget extends StatelessWidget {
  const Profile_top_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/img/bg_pofile.webp'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            const Color.fromARGB(255, 37, 54, 0)
                .withOpacity(0.5), // 50% opacity
            BlendMode.darken,
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(bottom: 0, right: 110),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Zainul Abid',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 89, 175, 245),
              ),
            ),
            Text(
              'Futter Developer',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(179, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
