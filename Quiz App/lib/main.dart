import 'package:flutter/material.dart';
import 'package:quiz_world/pages/home.dart';
import 'package:quiz_world/pages/loading.dart';
import 'package:quiz_world/MenuDashboardPage.dart';

void main() {
  runApp(MaterialApp(
      title: 'Quiz World',
      initialRoute: '/home',
      routes: {
        '/home' : (context) => Home(),
        '/dashboard' : (context) => MenuDashboardPage(),
        '/loading': (context) => Loading(),
      },
    )
  );
}
