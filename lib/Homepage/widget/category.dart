import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({Key? key, required this.headname}) : super(key: key);
  String headname;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Text(
            headname,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
