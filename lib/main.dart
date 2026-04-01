import 'package:flutter/material.dart';
import 'package:flutter_app/global_variables.dart';
import 'package:flutter_app/home_page.dart';
import 'package:flutter_app/product_details.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Shopping App',

      theme: ThemeData(appBarTheme:AppBarTheme(titleTextStyle:TextStyle(fontSize: 20, color: Colors.white24)  ,) ,
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        textTheme: TextTheme(
          titleLarge:  TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          titleSmall:  TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),useMaterial3: true,
      ),debugShowMaterialGrid: false,

      home:HomePage(),
    );
  }
}
