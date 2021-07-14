library app;

//imports

//exports
export 'package:flutter/material.dart';
export 'screens/welcome.dart';
export 'screens/home.dart';
export 'services/food_cell.dart';
export 'services/top_of_week_cell.dart';
export 'screens/food_item.dart';
export 'screens/cart.dart';
export 'services/cart_cell.dart';
export 'screens/payment.dart';
export 'services/payment_cell.dart';
export 'models/item.dart';
export 'dummy/data.dart';

List<bool> checkbox = List.generate(2, (index) => false);
double cartCount = 0;
double subtotal = 0.0;
double delivery = 2.50;
double total = delivery;
bool cartFirstVisit = false;
