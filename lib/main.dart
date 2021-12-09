import 'package:flutter/material.dart';
import 'package:smapleespad/pages/spalsh/spalsh.dart';

//==============================================================================

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'espad',
      home: Splash(),
    );

  }
}
