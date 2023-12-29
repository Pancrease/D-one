// ignore_for_file: unused_field, prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/appbar.dart';
import 'package:flutter_application_1/Widgets/bottombar2.dart';
import 'package:flutter_application_1/Widgets/drawer.dart';
import 'package:flutter_application_1/screens/Menus_Screen/menu1.dart';
import 'package:flutter_application_1/screens/Menus_Screen/menu2.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';

class Menu extends StatefulWidget {
  final String? userName;
  const Menu({super.key, this.userName});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<String> items = ["Daily", "Average"];
  int pos0 = 0;
  int pos1 = 1;
  int current = 0;
  DatePickerController _datePickerController = DatePickerController();
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    DateTime startDate = now.subtract(const Duration(days: 14));
    DateTime endDate = now.add(const Duration(days: 0));
    // print('startDate = $startDate ; endDate = $endDate');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
          title: 'menu',
          backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        ),
        drawer: const Drawer(
          child: drawer(),
        ),
        bottomNavigationBar: Bottonbar(
          userName: widget.userName,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: (MediaQuery.of(context).size.height) / 1.67,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width / 2) - 20,
                          // height: 200,
                          // padding: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            // border: Border(left: pos0==i)
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                              topLeft: pos0 == index
                                  ? const Radius.circular(20)
                                  : const Radius.circular(0),
                              topRight: pos1 == index
                                  ? const Radius.circular(20)
                                  : const Radius.circular(0),
                            ),
                            border: current == index
                                ? null
                                : Border.all(
                                    color: const Color.fromARGB(255, 219, 218, 218),
                                    width: 2),
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: current == index
                                    ? const Color.fromARGB(255, 6, 80, 141)
                                    : const Color.fromARGB(255, 102, 102, 102),
                                fontSize: 20,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: pos0 == current ? const menu1() : null,
                ),
                Container(
                  child: pos1 == current ? const menu2() : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
