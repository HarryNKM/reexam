

import 'package:flutter/material.dart';

import '../screen/adddata/add_Screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/invoice/invoice_screen.dart';
import '../screen/product/product_screen.dart';

Map<String,WidgetBuilder> app_routes={
  '/' :(context) => HomeScreen(),
  'product' :(context) => ProductScreen(),
  'add' :(context) => AddDataScreen(),
  'invoice' :(context) => InvoiceScreen(),
};

