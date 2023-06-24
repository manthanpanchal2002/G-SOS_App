import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/landing_page.dart';
import 'package:my_app/pages/profile_page.dart';
import 'package:my_app/pages/training_page.dart';
// import 'package:my_app/pages/terms_and_condition_page.dart';
import 'about_us_page.dart';
// import 'assign_quiz_page.dart';
import 'dashboard_page.dart';
// import 'notification_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    DashboardPage(),
    TrainingPage(),
    ProfilePage(),
    AboutUsPage(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = 0;
    setState(() {
      _selectedIndex = index;
    });
  }

  // const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => ProfilePage()));
      //       },
      //       icon: const Icon(
      //         CupertinoIcons.person_fill,
      //         color: Colors.black,
      //         size: 22,
      //       ),
      //     ),
      //     // IconButton(
      //     //     onPressed: () {},
      //     //     icon: const Icon(
      //     //       CupertinoIcons.question_circle_fill,
      //     //       color: Colors.black,
      //     //       size: 22,
      //     //     )),
      //   ],
      //   elevation: 0,
      //   scrolledUnderElevation: 3,
      //   shadowColor: Color(0xFFa4c3b2),
      // ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedLabelStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: Colors.black,
              size: 20,
            ),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.video_camera,
              color: Colors.black,
              size: 20,
            ),
            label: 'Tutorials',
            backgroundColor: Colors.white,
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
              color: Colors.black,
              size: 20,
            ),
            label: "$user_name's space",
            backgroundColor: Colors.white,
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.question_circle_fill,
              color: Colors.black,
              size: 20,
            ),
            label: 'Help',
            backgroundColor: Colors.white,
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
