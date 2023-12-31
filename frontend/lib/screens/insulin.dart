import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Widgets/appbar.dart';
import 'package:flutter_application_1/Widgets/back_button.dart';
import 'package:flutter_application_1/screens/add_menu.dart';
import 'package:flutter_application_1/screens/bloodtest.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Insuline extends StatefulWidget {
  const Insuline({super.key});

  @override
  State<Insuline> createState() => _InsulineState();
}

class _InsulineState extends State<Insuline> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: CustomAppBar(
            title: 'Insuline',
            backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
          ),
          body: Stack(
            children: [
              backnext(
                backvisible: "true",
                nextvisible: "false",
                pathback: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Add()));
                },
                pathnext: () {},
              ),
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(
                      "Enter Your Last Injected Dose",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(4, 64, 110, 1)),
                    ),
                    SizedBox(height: 30),
                    Text(
                      _currentSliderValue.round().toString(),
                      style: TextStyle(fontSize: 100),
                    ),
                    Container(
                      height: 10,
                      child: Slider(
                        value: _currentSliderValue,
                        max: 60,
                        divisions: 60,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(230, 45)),
                      onPressed: () {
                        _onclickitem(_currentSliderValue.round().toString());
                        //_currentSliderValue.round().toString()
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Add(value: 1)));
                      },
                      child: const Text('Validate',
                          style: TextStyle(fontSize: 25)),
                    ),
                  ]))
            ],
          )),
    );
  }

  Future<void> _onclickitem(String s) async {
    final response = await http.post(
      Uri.parse('http://192.168.4.107:5002/post-insul'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'InsulSug': s,
      }),
    );
  }
}
