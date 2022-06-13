import 'package:flutter/material.dart';
import 'package:netflixe_tdm/ComingSoon/granter.dart';
import 'package:netflixe_tdm/Functions/function.dart';

import '../moviedatabase/moviedatabase.dart';

class Comingsoon extends StatefulWidget {
  Comingsoon({
    Key? key,
  }) : super(key: key);

  @override
  State<Comingsoon> createState() => _ComingsoonState();
}

class _ComingsoonState extends State<Comingsoon> {
  List<Moviedatabase> data = [];
  @override
  void initState() {
    super.initState();
    thadatafinch();
  }

  thadatafinch() async {
    final Data = await getallData(catory: "upcoming");
    setState(() {
      data = Data;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return data.isEmpty
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CircularProgressIndicator(
                strokeWidth: 0.9,
              ),
              Text(
                "Loading Data",
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 17,
                ),
              )
            ],
          ))
        : Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 00,
              toolbarHeight: 80,
              title: const Text(
                "Coming Soon",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              actions: [
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
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.notifications_none_outlined,
                                  size: 28,
                                  color: Colors.white.withOpacity(0.9),
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Notifaications",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.9)),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 22,
                              color: Colors.white.withOpacity(0.9),
                            ))
                      ],
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(data.length, (index) {
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Geranter(
                              data: data,
                              index: index,
                            ));
                      }))
                ],
              )),
            ),
          );
  }
}
