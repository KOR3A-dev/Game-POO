import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game_poo/levels/basic_level/welcome_lesson.dart';
import 'package:game_poo/services/local_storage_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class IntroPoo extends StatefulWidget {
  const IntroPoo({super.key});

  @override
  State<IntroPoo> createState() => _IntroPooState();
}

class _IntroPooState extends State<IntroPoo> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  List<Response> questionOne = [
    Response(
        question: "which of these in a programming language?",
        letter: 'a',
        option: 'Java',
        isCorrect: true),
    Response(
        question: "which of these in a programming language?",
        letter: 'b',
        option: 'Visual Studio Code',
        isCorrect: false),
    Response(
        question: "which of these in a programming language?",
        letter: 'c',
        option: 'Html 5',
        isCorrect: false),
  ];

  int lifes = 5;
  bool press = false;
  bool isFinal = false;

  void _doSomething() async {
    Timer(const Duration(seconds: 3), () {
      _btnController.success();
    });
    Timer(const Duration(seconds: 5), () {
      _btnController.reset();
    });
    Timer(const Duration(seconds: 6), () {
      incrementNavigationCounter();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeLesson()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            IconButton(
              color: Colors.black,
              iconSize: 37,
              icon: const Icon(Icons.cancel),
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 7),
              child: SimpleAnimationProgressBar(
                height: 13,
                width: 250,
                backgroundColor: Colors.black,
                foregrondColor: const Color.fromARGB(255, 220, 90, 70),
                ratio: 0.1,
                direction: Axis.horizontal,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(seconds: 3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Image.asset('assets/heart.gif', width: 31),
              ),
              Positioned(
                  right: 7,
                  top: 16,
                  child: Text(
                    "$lifes",
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontFamily: 'Space'),
                  ))
            ])
          ],
        ),
        Image.asset('assets/lesson1compare.jpg', width: 150),
        Padding(
          padding:
              const EdgeInsets.only(left: 50, right: 50, top: 4, bottom: 16),
          child: Text(
            questionOne[0].question,
            style: const TextStyle(
                fontFamily: 'Space',
                fontWeight: FontWeight.w900,
                fontSize: 30,
                wordSpacing: -7),
          ),
        ),

        //Response
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: questionOne.length,
              itemBuilder: (context, index) {
                Response response = questionOne[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        press = true;
                        if (response.letter == 'a') {
                          Timer(const Duration(seconds: 1), () {
                            Alert(
                                    context: context,
                                    type: AlertType.success,
                                    title: "Is correct!",
                                    buttons: [
                                      DialogButton(
                                        onPressed: () => Navigator.pop(context),
                                        width: 120,
                                        child: const Text(
                                          "Continue",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                    desc: "Java is a lenguage")
                                .show();
                          });
                          isFinal = true;
                        } else {
                          Timer(const Duration(seconds: 1), () {
                            Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "${response.option} Is not correct!",
                                    buttons: [
                                      DialogButton(
                                        onPressed: () => Navigator.pop(context),
                                        width: 120,
                                        child: const Text(
                                          "Continue",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                    desc: "continue studying!")
                                .show();
                          });
                          isFinal = true;
                          lifes -= 1;
                        }
                      });
                    },
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(310, 30)),
                      side: MaterialStateProperty.resolveWith((states) {
                        if (!press) {
                          return const BorderSide(
                              color: Colors.grey, width: 2.0);
                        } else {
                          if (response.letter == 'a') {
                            return BorderSide(
                                color: response.isCorrect
                                    ? Colors.green
                                    : Colors.red,
                                width: 2.0);
                          } else {
                            return const BorderSide(
                                color: Colors.red, width: 2.0);
                          }
                        }
                      }),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/letter-${response.letter.toLowerCase()}.png',
                          width: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          ". ${response.option}",
                          style: const TextStyle(
                              fontFamily: 'Space',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        isFinal
            ? Padding(
                padding: const EdgeInsets.only(bottom: 0, top: 0),
                child: RoundedLoadingButton(
                  color: Colors.green,
                  controller: _btnController,
                  onPressed: _doSomething,
                  successColor: Colors.green,
                  child: const Text("Continue",
                      style: TextStyle(color: Colors.white)),
                ),
              )
            : SizedBox()
      ],
    ));
  }
}

class Response {
  String question;
  String letter;
  String option;
  bool isCorrect;

  Response(
      {required this.letter,
      required this.option,
      required this.isCorrect,
      required this.question});
}
