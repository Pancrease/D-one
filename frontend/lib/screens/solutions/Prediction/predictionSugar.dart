import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/appbar.dart';
import 'package:flutter_application_1/Widgets/back_button.dart';
import 'package:flutter_application_1/screens/add_menu.dart';
import 'package:flutter_application_1/screens/menu.dart';

class PredictionSugar extends StatefulWidget {
  const PredictionSugar({super.key});

  @override
  State<PredictionSugar> createState() => _PredictionSugarState();
}

class _PredictionSugarState extends State<PredictionSugar> {
  @override
  int timeprediction = 10;
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: CustomAppBar(
                title: 'correction',
                backgroundColor: const Color.fromRGBO(250, 250, 250, 1)),
            body: Stack(
              children: [
                Stack(
                  children: [
                    backnext(
                      backvisible: "false",
                      nextvisible: "true",
                      pathback: () {},
                      pathnext: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Add()));
                      },
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('assets/blood.jpg')),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: const Text(
                          'Follow These Steps',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(4, 64, 110, 1)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Your blood sugar will be high in $timeprediction hours',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(4, 64, 110, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
