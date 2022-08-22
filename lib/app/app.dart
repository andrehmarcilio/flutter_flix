
import 'package:flutter/material.dart';

import '../view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme:  ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(121, 0, 0, 0),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.red.shade900
        )
      )
    );
  }
}