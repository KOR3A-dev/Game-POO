import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_poo/levels/intermediate_level/abstraction.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:game_poo/services/local_storage_service.dart';

class Polymorphism extends StatefulWidget {
  const Polymorphism({Key? key}) : super(key: key);

  @override
  State<Polymorphism> createState() => _PolymorphismState();
}

class _PolymorphismState extends State<Polymorphism> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  List<Response> questions = [
    Response(
      question:
          "Define el concepto de polimorfismo en la programación orientada a objetos.",
      options: [
        Option(
          letter: 'a',
          option: "La capacidad de un objeto para tomar varias formas y comportarse de diferentes maneras en función del contexto.",
          isCorrect: true,
        ),
        Option(
          letter: 'b',
          option: "La capacidad de una clase para heredar propiedades y comportamientos de otra clase.",
          isCorrect: false,
        ),
        Option(
          letter: 'c',
          option: "La capacidad de un objeto para contener atributos y métodos.",
          isCorrect: false,
        ),
      ],
    ),
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
        MaterialPageRoute(builder: (context) => const Abstraction()),
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
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 7,
                ),
                child: SimpleAnimationProgressBar(
                  height: 13,
                  width: 250,
                  backgroundColor: Colors.black,
                  foregrondColor: const Color.fromARGB(255, 220, 90, 70),
                  ratio: getCounter(),
                  direction: Axis.horizontal,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(seconds: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Stack(
                children: [
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
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Space',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Text(
              questions[0].question,
              style: const TextStyle(
                fontFamily: 'Space',
                fontWeight: FontWeight.w900,
                fontSize: 20,
                wordSpacing: -7,
              ),
            ),
          ),

          // Respuestas
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: questions[0].options.length,
                itemBuilder: (context, index) {
                  Option option = questions[0].options[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          press = true;
                          if (option.letter == 'a') {
                            Timer(const Duration(seconds: 1), () {
                              Alert(
                                      context: context,
                                      type: AlertType.success,
                                      title: "Is correct!",
                                      buttons: [
                                        DialogButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          width: 120,
                                          child: const Text(
                                            "Continue",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        )
                                      ],
                                      desc:
                                          "Excelente")
                                  .show();
                            });
                            isFinal = true;
                          } else {
                            Timer(const Duration(seconds: 1), () {
                              Alert(
                                      context: context,
                                      type: AlertType.error,
                                      title: "${option.option} Is not correct!",
                                      buttons: [
                                        DialogButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
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
                        fixedSize: MaterialStateProperty.all<Size>(
                          const Size(310, 69),
                        ),
                        side: MaterialStateProperty.resolveWith((states) {
                          if (!press) {
                            return const BorderSide(
                                color: Colors.grey, width: 2.0);
                          } else {
                            if (option.letter == 'a') {
                              return BorderSide(
                                  color: option.isCorrect
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
                            'assets/letter-${option.letter.toLowerCase()}.png',
                            width: 24,
                          ),
                          const SizedBox(width: 10.5),
                          Expanded(
                            child: Text(
                              "${option.option}",
                              style: const TextStyle(
                                fontFamily: 'Space',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
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
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class Response {
  String question;
  List<Option> options;

  Response({required this.question, required this.options});
}

class Option {
  String letter;
  String option;
  bool isCorrect;

  Option({
    required this.letter,
    required this.option,
    required this.isCorrect,
  });
}
