import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Futter demo',
    theme: ThemeData(primarySwatch: Colors.orange),
    home: const HomeScreen(title: 'Flutter deom'),
  ));
}
