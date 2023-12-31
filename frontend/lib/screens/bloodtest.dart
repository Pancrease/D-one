// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Widgets/appbar.dart';
import 'package:flutter_application_1/Widgets/back_button.dart';
import 'package:flutter_application_1/Widgets/bottombar2.dart';
import 'package:flutter_application_1/Widgets/drawer.dart';
import 'package:flutter_application_1/screens/add_menu.dart';
import 'package:flutter_application_1/screens/menu.dart';
import 'package:flutter_application_1/screens/solutions/correction.dart';
import 'package:flutter_application_1/screens/solutions/warning.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class Bloodtest extends StatefulWidget {
  const Bloodtest({super.key});
  @override
  State<Bloodtest> createState() => BloodtestState();
}

String blood = '0';
var c = true;
int r = 0;
int g = 0;
int b = 0;
int op = 1;

// final Color color;
class BloodtestState extends State<Bloodtest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
            title: 'bloodtest',
            backgroundColor: const Color.fromRGBO(250, 250, 250, 1)),
        drawer: const Drawer(
          child: drawer(),
        ),
        bottomNavigationBar: Bottonbar(),
        body: Stack(
          children: [
            backnext(
              backvisible: "true",
              nextvisible: "false",
              pathback: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Add()));
              },
              pathnext: () {
                var value = blood;
                if (double.parse(value) >= 160) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Correction()));
                } else if (double.parse(value) > 140 &&
                    double.parse(value) < 160) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Warning()));
                } else if (double.parse(value) < 140) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Menu()));
                }
              },
            ),
            Center(
              child: Transform(
                transform: Matrix4.rotationY(pi),
                alignment: Alignment.center,
                child: CircularPercentIndicator(
                  radius: 100,
                  lineWidth: 20.0,
                  percent: (int.parse(blood) / 300),
                  progressColor: Color.fromRGBO(r, g, b, 1),
                  backgroundColor: Color.fromRGBO(r, g, b, 0.2),
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 130, right: 140),
                child: TextFormField(
                  maxLength: 3,
                  decoration: const InputDecoration(
                    counterText: '',
                    hintText: '---',
                    hintStyle: TextStyle(fontSize: 20, letterSpacing: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0, color: Colors.transparent), //<-- SEE HERE
                    ),
                  ),
                  style: const TextStyle(fontSize: 25),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    // for below version 2 use this
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (var value) {
                    setState(
                      () {
                        blood = value;

                        if (value == '') {
                          value = '0';
                          blood = value;
                          // blood = value;
                        } else {
                          if (double.parse(blood) > 300) {
                            blood = '300';
                          }
                        }
                        if (double.parse(value) < 140) {
                          r = 0;
                          g = 255;
                          b = 0;
                        } else if (double.parse(value) > 140 &&
                            double.parse(value) < 160) {
                          r = 255;
                          g = 215;
                          b = 0;
                        } else if (double.parse(value) >= 160) {
                          r = 255;
                          g = 0;
                          b = 0;
                        }
                      },
                    );
                  },
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  "mg/l",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 80),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(230, 45)),
                    onPressed: () {
                      final currentDate = DateTime.now();
                      final formattedDate =
                          DateFormat('yyyy-MM-dd HH:mm:ss').format(currentDate);
                      //double.parse(blood)
                      var value = blood;
                      if (double.parse(value) >= 160) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Correction()));
                      } else if (double.parse(value) > 140 &&
                          double.parse(value) < 160) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Warning()));
                      } else if (double.parse(value) < 140) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Menu()));
                      }
                    },
                    child:
                        const Text('Validate', style: TextStyle(fontSize: 25)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
