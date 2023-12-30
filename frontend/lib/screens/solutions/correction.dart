import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/appbar.dart';
import 'package:flutter_application_1/Widgets/drawer.dart';
import 'package:flutter_application_1/Widgets/loading.dart';
import 'package:flutter_application_1/screens/menu.dart';
import 'package:flutter_application_1/screens/solutions/Prediction/predictioninsuline.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Correction extends StatefulWidget {
  const Correction({super.key});

  @override
  State<Correction> createState() => CorrectionState();
}

class CorrectionState extends State<Correction> {
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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('assets/pen.jpg')),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: const Text(
                          'Your Blood Sugar Is High',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(4, 64, 110, 1)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          'Do You Want a Proposition ?',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(4, 64, 110, 1)),
                        ),
                      ),
                      SizedBox(height: 25),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(230, 45)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loading(
                                onTimerComplete: (BuildContext context) {
                                  // Your condition to choose the next page

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Prediction(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        child:
                            const Text('Yes', style: TextStyle(fontSize: 25)),
                      ),
                      SizedBox(
                          height: 15), // Add some space between the buttons
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: const Size(190, 40)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Menu()));
                        },
                        child: const Text('No', style: TextStyle(fontSize: 25)),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
