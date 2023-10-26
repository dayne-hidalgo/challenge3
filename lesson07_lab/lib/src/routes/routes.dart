import 'package:flutter/material.dart';
import 'package:lesson07_lab/src/screens/bottom_nav_bar_screen.dart';
import 'package:lesson07_lab/src/screens/subscreens/data_tables_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    "/": (context) => const BottomNavBarScreen(),
    "/dataTable": (context) => DataTablesScreen(),

  };
}
