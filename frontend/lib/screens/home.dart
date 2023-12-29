import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_menu.dart';
import 'package:flutter_application_1/screens/menu.dart';
import 'package:flutter_application_1/screens/loginpage.dart';
import 'package:flutter_application_1/screens/Onboarding.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() =>  HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "menu": (context) => const Menu(),
          "add": (context) => const Add(),
          "login": (context) => const LoginPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'D-one',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //MATBDLOHACH GHIR DKHL W DIR NEXT NEXT....
        home: const Onboarding());
  }
}
