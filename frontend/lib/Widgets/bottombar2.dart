import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_menu.dart';
import 'package:flutter_application_1/screens/Setting.dart';
import 'dart:math';

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}

// ignore: must_be_immutable
class Bottonbar extends StatefulWidget {
  String? text;
  // ignore: non_constant_identifier_names
  String? UserName;

  // ignore: non_constant_identifier_names
  Bottonbar({Key? key, this.text, this.UserName}) : super(key: key);
  @override
  State<Bottonbar> createState() => BottonbarState();
}

class BottonbarState extends State<Bottonbar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10.0, right: 10.0),
      height: 80,
      width: 80,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 120, 188, 243),
            foregroundColor: Colors.white,
            splashColor: Colors.blue,
            focusColor: Colors.blue,
            heroTag: generateRandomString(5),
            // widget.text,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Add()),
              );
            },
            child: const Icon(Icons.add_outlined),
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(117, 185, 184, 184).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(5, 0), // changes position of shadow
                ),
              ],
            ),
            child: BottomAppBar(
              elevation: 10,
              shape: const CircularNotchedRectangle(),
              color: const Color.fromARGB(185, 255, 255, 255),
              child: IconTheme(
                data: const IconThemeData(
                  color: Color.fromARGB(255, 102, 179, 243),
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(255, 187, 187, 187),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SetteingPage(username: widget.UserName),
                            ),
                          );
                        },
                        icon: const Icon(Icons.settings_outlined),
                      ),
                      IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                        },
                        icon: const Icon(Icons.book_outlined),
                        padding: const EdgeInsets.only(right: 50.0),
                      ),
                      IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                        },
                        icon: const Icon(Icons.notifications_outlined),
                        padding: const EdgeInsets.only(left: 50.0),
                      ),
                      IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                        },
                        icon: const Icon(Icons.person_outline),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
