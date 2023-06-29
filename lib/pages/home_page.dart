import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/landing_page.dart';
import 'package:my_app/pages/profile_page.dart';
import 'package:my_app/pages/training_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard_page.dart';
import 'help_section_onNav.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

SharedPreferences? logindata;
String? username;

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata?.getString('username');
    });
  }

  final List<Widget> _widgetOptions = [
    DashboardPage(),
    TrainingPage(),
    ProfilePage(),
    HelpSectionOnNav(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = 0;
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
       
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
              color: Colors.black,
              size: 20,
            ),
            label: "$user_name's space",
            backgroundColor: Colors.white,
  
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.question_circle_fill,
              color: Colors.black,
              size: 20,
            ),
            label: 'Help',
            backgroundColor: Colors.white,
   
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
