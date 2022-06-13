import 'package:flutter/material.dart';
import 'package:netflixe_tdm/moviedatabase/moviedatabase.dart';

class Mainfram extends StatelessWidget {
  Mainfram({
    Key? key,
    required this.index,
    this.fontsize,
    required this.color,
    required this.data,
  }) : super(key: key);
  double? fontsize;
  Color color;
  int index;
  List<Moviedatabase> data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Text(
        data[index].overview!,
        style: TextStyle(
          color: color,
          fontSize: fontsize,
        ),
      ),
    );
  }
}
