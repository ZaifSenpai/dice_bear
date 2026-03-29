import 'package:flutter/material.dart';

import 'widgets/dice_bear_playground_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DiceBear Playground',
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const DiceBearPlaygroundPage(),
    );
  }
}
