import 'package:flutter/material.dart';


import 'app/core/p.dart';
import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  P.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: Home(),
    );
  }
}

