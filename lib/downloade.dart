import 'package:flutter/material.dart';

class downloade extends StatelessWidget {
  const downloade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: const Text(
            "Downloade",
            style: TextStyle(fontSize: 26),
          ),
        ),
        backgroundColor: Colors.black,
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Image.asset(
                  'asstes/downloadelogo.png',
                  color: Colors.white,
                  fit: BoxFit.cover,
                  width: 250,
                ),
              ),
            ),
          ),
        ));
  }
}
