import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screens/solutions/Prediction/predictioninsuline.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:async';

class Loading extends StatefulWidget {
  final Function(BuildContext context) onTimerComplete;
  const Loading({Key? key, required this.onTimerComplete}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 4),
      () => widget.onTimerComplete(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            // scaffold of the app
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.inkDrop(
                // LoadingAnimationwidget that call the
                color: Color.fromARGB(
                    255, 2, 2, 102), // staggereddotwave animation
                size: 100,
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Text(
                  'Magic is Happening',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(4, 64, 110, 1)),
                ),
              ),
            ],
          ),
        )));
  }
}
