import 'package:flutter/material.dart';
import 'package:netflixe_tdm/Search/Search.dart';
import 'package:netflixe_tdm/downloade.dart';

import '../ComingSoon/coming_soon.dart';
import '../Homepage/home_page.dart';
import 'ButtomNavgation/ButtonNavgtion.dart';

class Netflex extends StatelessWidget {
  Netflex({Key? key}) : super(key: key);
  final pages = [
    const Homepage(),
    Comingsoon(),
    const Search(),
    const downloade()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      bottomNavigationBar: const DownnavigationBar(),
      body: ValueListenableBuilder(
        builder: (BuildContext context, int updatedvalue, _) {
          return pages[updatedvalue];
        },
        valueListenable: DownnavigationBar.selectedvalu,
      ),
    );
  }
}

List<Widget> appbaricons = [
  const Icon(
    Icons.format_list_bulleted_outlined,
    size: 30,
  ),
  const SizedBox(
    width: 40,
  ),
  const Icon(
    Icons.account_circle,
    size: 30,
  ),
  const SizedBox(
    width: 20,
  ),
];
