import 'package:flutter/material.dart';

class Topicons extends StatelessWidget {
  const Topicons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'asstes/logo.png',
            width: 80,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.collections_bookmark,
                    size: 28,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    size: 28,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
