import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homescreen.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor:   Color(0xffcfd9df),
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.grey

  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {                                                           
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purpleAccent),
      home:const HomeScreen(),
      
    );
  }
}