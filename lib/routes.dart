import 'package:flutter/material.dart';
import 'package:ui_chart_devera/screens/home/home_screen.dart';
import 'package:ui_chart_devera/screens/items/item_screen.dart';

final Map<String, WidgetBuilder> route={
HomeScreen.routeName: (context) => HomeScreen(),
  ItemScreen.routeName: (context) => ItemScreen(title: 'Simple Buget', local: 0, amountItem: 0,),
};