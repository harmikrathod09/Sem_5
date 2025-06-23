import 'package:get/get.dart';
class NonReactiveVarModel{
  int _count=0;

  int get count => _count;

  void increaseVar(){
    ++_count;
  }
}