// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/appbar.dart';
import 'package:flutter_application_1/Widgets/back_button.dart';
import 'package:flutter_application_1/Widgets/bottombar2.dart';
import 'package:flutter_application_1/Widgets/drawer.dart';
import 'package:flutter_application_1/Widgets/loading.dart';
import 'package:flutter_application_1/screens/bloodtest.dart';
import 'package:flutter_application_1/screens/food.dart';
import 'package:flutter_application_1/screens/insulin.dart';
import 'package:flutter_application_1/screens/menu.dart';
import 'package:flutter_application_1/screens/solutions/Prediction/predictionSugar.dart';
import 'dart:math';

import 'package:flutter_application_1/screens/sport.dart';

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}

class Add extends StatefulWidget {
  final double? value;
  const Add({Key? key, this.value}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  int pos0 = 0;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      pos0 = widget.value!.toInt();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
            title: 'add',
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
                    MaterialPageRoute(builder: (context) => const Menu()));
              },
            ),
            Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: const EdgeInsets.all(40.0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: generateRandomString(5),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Food()));
                    },
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue, width: 4)),
                    child: Container(
                      child: const Image(image: AssetImage('assets/Food.png')),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 100, 100, 100)
                                .withOpacity(0.1),
                            spreadRadius: 10,
                            blurRadius: 10,
                            offset: const Offset(3, 5),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white.withOpacity(1),
                  ),
                  FloatingActionButton(
                    heroTag: generateRandomString(7),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Sport()));
                    },
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.indigo, width: 4)),
                    child: Container(
                      child: const Image(image: AssetImage('assets/Sport.png')),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 100, 100, 100)
                                .withOpacity(0.1),
                            spreadRadius: 10,
                            blurRadius: 10,
                            offset: const Offset(3, 5),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  FloatingActionButton(
                    heroTag: generateRandomString(10),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Bloodtest()));
                    },
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.red, width: 4)),
                    child: Container(
                      child: const Image(image: AssetImage('assets/Blood.png')),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 100, 100, 100)
                                .withOpacity(0.1),
                            spreadRadius: 10,
                            blurRadius: 10,
                            offset: const Offset(3, 5),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  FloatingActionButton(
                    heroTag: generateRandomString(12),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Insuline()));
                    },
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.green, width: 4)),
                    child: Container(
                      child: const Image(
                        image: AssetImage('assets/Needle.png'),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 100, 100, 100)
                                .withOpacity(0.1),
                            spreadRadius: 10,
                            blurRadius: 10,
                            offset: const Offset(3, 5),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 400),
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                          child: pos0 == index
                              ? OutlinedButton(
                                  onPressed: () {},
                                  child: Text('HOLD'),
                                  style: OutlinedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(30),
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Loading(
                                          onTimerComplete:
                                              (BuildContext context) {
                                            // Your condition to choose the next page

                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PredictionSugar(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('PREDICT'),
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(30),
                                  ),
                                ));
                    }))
          ],
        ),
      ),
    );
  }
}
