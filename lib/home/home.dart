import 'package:flutter/material.dart';
import 'package:custom_accordion/custom_accordion.dart';
import 'package:simple_animated_button/simple_animated_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Topic> topicsBasic = [
      Topic(
          topic: 'Introduction to object-oriented programming',
          isUnlocked: true),
      Topic(topic: 'Classes and objects', isUnlocked: false),
      Topic(topic: 'Encapsulation', isUnlocked: false),
    ];

    List<Topic> topicsIntermediate = [
      Topic(topic: 'Inheritance', isUnlocked: false),
      Topic(topic: 'Polymorphism', isUnlocked: false),
      Topic(topic: 'Abstraction', isUnlocked: false),
    ];

    List<Topic> topicsAdvance = [
      Topic(topic: 'Design patterns', isUnlocked: false),
      Topic(topic: 'SOLID', isUnlocked: false),
      Topic(
          topic: 'Refactoring and Test Driven Design (TDD)', isUnlocked: false),
    ];

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Home",
            style: TextStyle(
              fontFamily: 'Space',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              ElevatedLayerButton(
                onClick: () {},
                buttonHeight: 60,
                buttonWidth: 270,
                animationDuration: const Duration(milliseconds: 200),
                animationCurve: Curves.ease,
                topDecoration: BoxDecoration(
                    color: const Color.fromARGB(255, 237, 115, 106),
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(22))),
                topLayerChild: const Text(
                  "StartTeaching()",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Space',
                  ),
                ),
                baseDecoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(18))),
              ),
              const SizedBox(height: 10),

              const Text(
                "Progress : 0/9",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Space',
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 20),
                    child: Image.asset('assets/book.gif', width: 40),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25, left: 8),
                    child: Text(
                      "Quick access",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Space',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CustomAccordion(
                  title: 'Lesson list',
                  subTitle: "From basic - advance level",
                  headerBackgroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  titleStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  subTitleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  toggleIconOpen: Icons.arrow_forward,
                  toggleIconClose: Icons.keyboard_arrow_up_sharp,
                  headerIconColor: Colors.black,
                  accordionElevation: 1,
                  widgetItems: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text("Basic Level"),
                      ),
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          itemCount: topicsBasic.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(
                                          '- ${topicsBasic[index].topic}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(
                                                255, 115, 114, 114),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Icon(
                                        size: 16,
                                        topicsBasic[index].isUnlocked
                                            ? Icons.lock_open
                                            : Icons.lock,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text("Intermediate Level"),
                      ),
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          itemCount: topicsBasic.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(
                                          '- ${topicsIntermediate[index].topic}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(
                                                255, 115, 114, 114),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Icon(
                                        size: 16,
                                        topicsIntermediate[index].isUnlocked
                                            ? Icons.lock_open
                                            : Icons.lock,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text("Advance Level"),
                      ),
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          itemCount: topicsBasic.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(
                                          '- ${topicsAdvance[index].topic}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(
                                                255, 115, 114, 114),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Icon(
                                        size: 16,
                                        topicsAdvance[index].isUnlocked
                                            ? Icons.lock_open
                                            : Icons.lock,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CustomAccordion(
                  title: 'STUDY GUIDELINES',
                  subTitle: "Topics that may be useful",
                  headerBackgroundColor: Colors.white,
                  titleStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  subTitleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  toggleIconOpen: Icons.arrow_forward,
                  toggleIconClose: Icons.keyboard_arrow_up_sharp,
                  headerIconColor: Colors.black,
                  accordionElevation: 1,
                  widgetItems: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'In development...',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Topic {
  String topic;
  bool isUnlocked;

  Topic({required this.topic, required this.isUnlocked});
}
