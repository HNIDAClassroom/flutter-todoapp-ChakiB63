import 'package:flutter/material.dart';

import 'package:tp3/tasks.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 20),
        useMaterial3: true,
      ),
      home: const Tasks(),
    ),
  );
}
