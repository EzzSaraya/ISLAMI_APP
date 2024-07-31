import 'package:flutter/material.dart';

import 'Home/home_screen.dart';

void main() {
  runApp(islami());
}

class islami extends StatelessWidget {
  const islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routename,
      routes: {HomeScreen.routename: (context) => HomeScreen()},
    );
  }
}
