import 'package:flutter/material.dart';

class CenterButton extends StatelessWidget {
  const CenterButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 34,
                  )),
              const Text(
                "My List",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          ElevatedButton.icon(
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.white),
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle,
                size: 30,
                color: Colors.black,
              ),
              label: const Text(
                "Paly",
                style: TextStyle(color: Colors.black),
              )),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.info_outline,
                    size: 32,
                  )),
              const Text(
                "info",
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
