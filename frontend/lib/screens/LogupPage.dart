// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/background/BackgroundLogin.dart';
import 'forms/logupform.dart';

class LogupPage extends StatefulWidget {
  const LogupPage({super.key});

  @override
  State<LogupPage> createState() => _LogupPageState();
}

class _LogupPageState extends State<LogupPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Stack(
          children: const [
            BackgroundLogin(),
            LogupForm(),
          ],
        ),
      ),
    );
  }
}
