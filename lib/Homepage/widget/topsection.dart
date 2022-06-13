import 'package:flutter/material.dart';

class Topsection extends StatelessWidget {
  Topsection({Key? key, required this.onpresse, required this.text})
      : super(key: key);
  String text;
  void Function() onpresse;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: onpresse,
            child: Text(text)),
      ],
    );
  }
}
