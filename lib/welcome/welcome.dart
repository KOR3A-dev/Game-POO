import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_poo/home/home.dart';
import 'package:game_poo/services/local_storage_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final TextEditingController _userNameController = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  bool isNotEmptyUsername = false;

  @override
  void initState() {
    super.initState();
    initializeNavigationCounter();
  }

  void _doSomething() async {
    Timer(const Duration(seconds: 3), () {
      _btnController.success();
    });
    Timer(const Duration(seconds: 5), () {
      _btnController.reset();
    });
    Timer(const Duration(seconds: 6), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
      _userNameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Image.asset('assets/welcome.gif'),
            ),
            const Center(
              child: Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Space',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
              child: Center(
                  child: TextFormField(
                controller: _userNameController,
                onChanged: (value) {
                  setState(() {
                    isNotEmptyUsername = value.isNotEmpty;
                  });
                },
                style: const TextStyle(
                    color: Colors.black, fontFamily: 'Space', fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Ej : Pepito perez...',
                  prefixIcon: Icon(Icons.smart_toy, color: Colors.black),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              )),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 31.5, vertical: 10),
              child: Center(
                child: Text(
                  "Here you can learn or improve your understanding of object oriented programming, let's start now!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Space',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: RoundedLoadingButton(
                color: const Color.fromARGB(255, 237, 115, 106),
                controller: _btnController,
                onPressed: isNotEmptyUsername ? _doSomething : null,
                successColor: Colors.green,
                child: const Text("Let's do it",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                  child: Text(
                "Version 1.0.0",
                style: TextStyle(color: Colors.grey),
              )),
            )
          ],
        ),
      ),
    );
  }
}
