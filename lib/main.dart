import 'package:flutter/material.dart';

import 'Contoll_Room/All_Controll.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: const TextTheme()),
      home: Netflex(),
    );
  }
}
