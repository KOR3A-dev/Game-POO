import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

final LocalStorage localStorage = LocalStorage('app_storage');

late final ValueNotifier<int> navigationCounter;

Future<void> initLocalStorage() async {
  await localStorage.ready;
}

void initializeNavigationCounter() {
  double storedValue =
      double.parse(localStorage.getItem('navigation_counter') ?? '0.0');
  int intValue = storedValue.toInt();
  navigationCounter = ValueNotifier(intValue);
}

void incrementNavigationCounter() {
  int newValue = navigationCounter.value + 1;
  navigationCounter.value = newValue;
  localStorage.setItem('navigation_counter', newValue.toString());
  print(navigationCounter.value);
  print("0.$newValue");
}

int getProgress() {
  return navigationCounter.value;
}

double getCounter() {
  int intValue = navigationCounter.value;
  return double.parse("0.$intValue");
}