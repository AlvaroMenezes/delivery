import 'package:flutter/material.dart';

import 'di/injection.dart';
import 'features/restaurant_list/presenter/ui/restaurants_list.dart';

void main() {
  setupDependenceInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RestaurantList());
  }
}
