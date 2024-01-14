import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_menu.dart';
import 'package:flutter_application_1/screens/bloodtest.dart';
import 'package:flutter_application_1/screens/yum.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  final TextEditingController _editingController = TextEditingController();
  String apiResponse = '';

  // ignore: non_constant_identifier_names
  List FoodItems = [];
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
            child: Column(
              children: [
                const Text(
                  "What are you craving?",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Color.fromARGB(255, 34, 80, 133)),
                ),
                const SizedBox(height: 10),
                TextField(
                  onEditingComplete: _onSearchSubmitted,
                  controller: _editingController,
                  decoration: const InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: foodItems.isEmpty
                      ? const Center(
                          child: Text(
                            "Search for a food",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                color: Color.fromARGB(255, 34, 80, 133)),
                          ),
                        )
                      : ListView.builder(
                          itemCount: foodItems.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  _onclickitem(foodItems[index].foodName);
                                  // print(
                                  //     'Item tapped: ${foodItems[index].foodName}');
                                  // send api request to get the food nutrition values and store them to
                                },
                                child: ListTile(
                                  leading: Image.network(
                                      foodItems[index].photoUrl ?? '',
                                      width: 48.0,
                                      height: 48.0),
                                  title: Text(foodItems[index].foodName),
                                  subtitle: Text(foodItems[index].servingUnit),
                                ));
                          }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<FoodItem> foodItems = [];
  Future<void> _onclickitem(String s) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.102:5002/post-food'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'food': s,
      }),
    );
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Add()));
  }

  Future<void> _onSearchSubmitted() async {
    final searchValue = _editingController.text.trim();
    if (searchValue.isNotEmpty) {
      try {
        final headers = {
          'Content-Type': 'application/json',
          'x-app-id': '959cfeaa',
          'x-app-key': 'dab04b128e9cbbe61b57e99317f78387',
        };
        final response = await http.get(
          Uri.parse(
              'https://trackapi.nutritionix.com/v2/search/instant/?query=$searchValue'),
          headers: headers,
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

          final List<dynamic> commonList = jsonResponse['common'];

          setState(() {
            // Clear existing items in the list
            foodItems.clear();

            // Map the commonList to a list of FoodItem objects
            foodItems = commonList
                .map((item) => FoodItem(
                      foodName: item['food_name'],
                      servingUnit: item['serving_unit'],
                      photoUrl: item['photo']['thumb'],
                    ))
                .toList();
            print(foodItems);
          });
        } else {
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (error) {
        print('Error during API request: $error');
      }
    }
  }
}

class FoodItem {
  final String foodName;
  final String servingUnit;
  final String? photoUrl;

  FoodItem({required this.foodName, required this.servingUnit, this.photoUrl});
}
