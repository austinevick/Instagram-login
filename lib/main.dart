import 'package:flutter/material.dart';
import 'package:instagram_login/instagram_view.dart';
import 'package:instagram_login/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: LandingPage(),
    );
  }
}
