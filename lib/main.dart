import 'package:flutter/material.dart';
import 'package:restoran_app/detail_restaurant.dart';
import 'package:restoran_app/splash_screen.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        MyHomePage.routeName: (context) => const  MyHomePage(title: 'Flutter Demo Home Page'),
        DetailRestaurant.routeName: (context) => const DetailRestaurant(),
      },
    );
  }
}


