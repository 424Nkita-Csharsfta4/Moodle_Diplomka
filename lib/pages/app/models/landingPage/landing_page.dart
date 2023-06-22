import 'package:my_app/pages/app/models/profile/profile_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/svg.dart';

import '../home/home_view.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    HomeView(),
    Container(),
    Container(),
    Container(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        activeColor: Colors.blue,
        initialActiveIndex: selectedIndex,
        elevation: 0,
        style: TabStyle.fixedCircle,
        color: Colors.blue,
        items: const [
          TabItem(icon: Icon(Icons.home), title: ''),
          TabItem(icon: Icon(Icons.search), title: ''),
          TabItem(icon: Icon(Icons.add), title: ''),
          TabItem(icon: Icon(Icons.favorite), title: ''),
          TabItem(icon: Icon(Icons.account_circle), title: ''),
        ],
        onTap: (int i) {
          setState(() {
            selectedIndex = i;
          });
        },
      ),
    );
  }
}
