import 'package:flutter/material.dart';
import 'package:flutter_demo_app/ui/pages/HomePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Demo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: HomePage(title: title),
    );
  }
}

