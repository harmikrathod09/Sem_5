import 'package:lecture_adv_flutter/utils/import_file.dart';

class CounterController{
  CounterModel _counterModel=CounterModel();

  int get counterValue => _counterModel.count;

  void incrementCounter() => _counterModel.increment();

  void decrementCounter() => _counterModel.decrement();
}