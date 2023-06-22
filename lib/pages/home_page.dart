import 'package:my_app/pages/app/data/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:my_app/pages/app/models/landingPage/landing_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(defaultOverlay);
  runApp(const NewsFeedPage());
}

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Чат',
        debugShowCheckedModeBanner: false,
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LandingPage());
  }
}
