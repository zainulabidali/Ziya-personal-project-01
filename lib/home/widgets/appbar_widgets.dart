import 'package:flutter/material.dart';

class Appbar_widgets extends StatelessWidget implements PreferredSizeWidget {
  const Appbar_widgets({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                children: [
                  // Profile Card
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 4, 110, 149),
                            Color.fromARGB(255, 31, 123, 13),
                          ],
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/img/usthad.5.jpg',
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Abid Ali",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Flutter Developer",
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Space between profile and icon
                  SizedBox(width: 50),

                  // Notification Icon
                  notification_icon(),
                ],
              ),
              Positioned(
                top: 15,
                left: MediaQuery.of(context).size.width * 0.75 - 20,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(
                      
                        'assets/img/ziya_logo.png'), // Replace with actual image
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class notification_icon extends StatelessWidget {
  const notification_icon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 50, 109, 228),
          radius: 20,
          child: Icon(Icons.notifications,
              color: Color.fromARGB(255, 253, 253, 253)),
        ),
        Positioned(
          right: 4,
          top: 4,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 249, 248, 248),
                  spreadRadius: 1,
                ),
              ],
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
