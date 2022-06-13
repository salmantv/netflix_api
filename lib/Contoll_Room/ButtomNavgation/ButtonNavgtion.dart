// ignore: must_be_immutable
import 'package:flutter/material.dart';

class DownnavigationBar extends StatefulWidget {
  const DownnavigationBar({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedvalu = ValueNotifier(0);

  @override
  State<DownnavigationBar> createState() => _DownnavigationBarState();
}

class _DownnavigationBarState extends State<DownnavigationBar> {
  int? currentindex;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, int updatedvalue, _) {
        return SizedBox(
          height: 70,
          child: BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              currentIndex: updatedvalue,
              fixedColor: Colors.black,
              onTap: (index) {
                DownnavigationBar.selectedvalu.value = index;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.play_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: "",
                ),
              ]),
        );
      },
      valueListenable: DownnavigationBar.selectedvalu,
    );
  }
}
