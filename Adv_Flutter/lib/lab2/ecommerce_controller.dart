import 'package:adv_flutter/utils/import_export.dart';

class EcommerceController{
  EcommerceModel _ecommerceModel=EcommerceModel();

  List<Map<String, dynamic>> get products => _ecommerceModel.products;

  List<Map<String, dynamic>> get recentOrders => _ecommerceModel.recentOrders;
}