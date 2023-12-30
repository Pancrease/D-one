import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/appbar.dart';
import 'package:flutter_application_1/Widgets/back_button.dart';
import 'package:flutter_application_1/screens/menu.dart';

class Warning extends StatefulWidget {
  const Warning({super.key});

  @override
  State<Warning> createState() => _WarningState();
}

class _WarningState extends State<Warning> {
  @override
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
                                builder: (context) => const Menu()));
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
                            backgroundImage: AssetImage('assets/warning.jpg')),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: const Text(
                          'Warning',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(4, 64, 110, 1)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          'Please Misure Your Blood Sugar Again',
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
