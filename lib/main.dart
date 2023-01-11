import 'package:flutter/material.dart';

//Screens
import 'package:app_sliver_bakapp/src/screens/sliver_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// Este Widget le da inicio a la aplicacion.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sliver - BakApps',
      home: SliverScreen(),
    );
  }
}
