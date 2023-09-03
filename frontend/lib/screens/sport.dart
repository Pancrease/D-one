import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/appbar.dart';
import 'package:flutter_application_1/Widgets/back_button.dart';
import 'package:flutter_application_1/Widgets/bottombar2.dart';
import 'package:flutter_application_1/Widgets/drawer.dart';
import 'package:flutter_application_1/screens/add_menu.dart';


class Sport extends StatefulWidget {
  const Sport({super.key});
  @override
  State<Sport> createState() => _SportState();
}

class _SportState extends State<Sport> {
  var value = "";
  var sports = ['running', 'lifting', 'swimming', 'cycling', 'aerobics'];
  var index = 0;
  String? _selectedsport;
  var icon = [
    Icons.sports,
    Icons.directions_run,
    Icons.fitness_center,
    Icons.pool,
    Icons.directions_bike,
    Icons.directions_walk
  ];
  var cani = 'false';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: CustomAppBar(
              title: 'sport',
              backgroundColor: const Color.fromRGBO(250, 250, 250, 1)),
          drawer: const Drawer(
            child: drawer(),
          ),
          bottomNavigationBar: bottonbar(),
          body: Stack(
            children: [
              Positioned(
                  child: backnext(
                backvisible: "true",
                nextvisible: cani,
                pathback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Add()),
                  );
                },
                pathnext: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Add()),
                  );
                },
              )),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Icon(
                  icon[index],
                  size: 100,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                top: 190,
                left: 30,
                right: 30,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 7, 143, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(10),
                    value: _selectedsport,
                    onChanged: (value) {
                      setState(() {
                        _selectedsport = value;
                        index = sports.indexOf(_selectedsport!) + 1;
                      });
                    },
                    hint: const Center(
                        child: Text(
                      'Select a sport',
                      style: TextStyle(color: Colors.white),
                    )),
                    // Hide the default underline
                    underline: Container(),
                    // set the color of the dropdown menu
                    dropdownColor: const Color.fromARGB(255, 7, 143, 255),
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.arrow_downward,
                        color: Color.fromARGB(255, 217, 219, 221),
                      ),
                    ),
                    isExpanded: true,
                    // The list of options
                    items: sports
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Center(
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 217, 219, 221),
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ))
                        .toList(),
                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => sports
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 217, 219, 221),
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  onTimerDurationChanged: (value) {
                    setState(() {
                      this.value = value.toString();
                      if (this.value != '00:00:00.000000' &&
                          _selectedsport != null) {
                        cani = 'true';
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
