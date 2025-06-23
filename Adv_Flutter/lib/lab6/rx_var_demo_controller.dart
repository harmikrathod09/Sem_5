import 'package:get/get.dart';

class RxVarDemoController{
  RxInt _count=0.obs;

  RxInt get count => _count;

  void increseVar(){
    ++_count;
  }
}

