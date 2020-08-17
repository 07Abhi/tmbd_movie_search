import 'package:fluttertradexa/pages/welcomepage.dart';
import 'package:provider/provider.dart';
import 'moviemanager/moviemanager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>MovieManager(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.purple,
          fontFamily: 'Ubuntu',
        ),
        home: WelcomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
