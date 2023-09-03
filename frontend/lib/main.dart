import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginpage.dart';
import 'package:flutter_application_1/screens/Onboarding.dart';
import 'package:flutter_application_1/screens/add_menu.dart';
import 'package:flutter_application_1/screens/location.dart';
import 'package:flutter_application_1/screens/menu.dart';
import 'package:flutter_application_1/screens/phone.dart';
import 'package:flutter_application_1/screens/succes.dart';
import 'package:flutter_application_1/screens/verify.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? seen = prefs.getBool('seen');
  Widget screen;
  if (seen == null || seen == false) {
    screen = const Onboarding();
  } else {
    screen = const LoginPage();
  }

  runApp(MyApp(screen));
}

class MyApp extends StatelessWidget {
  final Widget _screen;

  const MyApp(this._screen, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "menu": (context) => menu(),
          "add": (context) => const Add(),
          "login": (context) => const LoginPage(),
          'phone': (context) => const MyPhone(),
          'verify': (context) => const MyVerify(),
          'location': (context) => const MyLocation(),
          'succes': (context) => const MySucces(),
        },
        debugShowCheckedModeBanner: false,
        title: 'D-one',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //MATBDLOHACH GHIR DKHL W DIR NEXT NEXT....
        home: _screen);
  }
}
