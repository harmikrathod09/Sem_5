import 'package:adv_flutter/utils/import_export.dart';

class NonReactiveVarController{
  NonReactiveVarModel _nonReactiveVarModel=NonReactiveVarModel();

  get count => _nonReactiveVarModel.count;

  void increaseVar()=> _nonReactiveVarModel.increaseVar();
}