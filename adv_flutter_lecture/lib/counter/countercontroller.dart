import 'package:adv_flutter_lecture/utils/import_file.dart';

class CounterController{
  CounterModel _counterModel=CounterModel();

  int get counterValue => _counterModel.count;

  void incrementCounter() => _counterModel.increment();

  void decrementCounter() => _counterModel.decrement();
}