import 'package:flutter/material.dart';
import 'package:netflixe_tdm/Functions/function.dart';
import 'package:netflixe_tdm/Homepage/widget/category.dart';
import 'package:netflixe_tdm/Homepage/widget/centerdbutton.dart';
import 'package:netflixe_tdm/Homepage/widget/movielist.dart';
import 'package:netflixe_tdm/Homepage/widget/topicons.dart';
import 'package:netflixe_tdm/Homepage/widget/topsection.dart';

import '../moviedatabase/moviedatabase.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Moviedatabase> Listofmovies = [];
  List<Moviedatabase> Listofmovies1 = [];
  List<Moviedatabase> Listofmovies2 = [];

  @override
  void initState() {
    super.initState();
    nowvalue();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Listofmovies.isEmpty
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
        : SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  width: size.height - 80,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 500,
                              width: 500,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${Listofmovies1[0].posterPath}',
                                frameBuilder: (context, child, frame, Was) {
                                  return child;
                                },
                                loadingBuilder: (contx, child, loding) {
                                  if (loding == null) {
                                    return child;
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CenterButton(),
                        const SizedBox(
                          height: 50,
                        ),
                        Category(headname: "Recent Movies"),
                        const SizedBox(
                          height: 20,
                        ),
                        MovieList(
                          Data: Listofmovies,
                          height: 180,
                          width: 130,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Category(headname: 'Popular on Netfilx'),
                        const SizedBox(
                          height: 30,
                        ),
                        MovieList(Data: Listofmovies1, height: 240, width: 170),
                        const SizedBox(
                          height: 30,
                        ),
                        Category(headname: "Anime List"),
                        const SizedBox(
                          height: 30,
                        ),
                        MovieList(Data: Listofmovies2, height: 180, width: 130),
                        const SizedBox(
                          height: 30,
                        ),
                      ]),
                ),
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.55),
                    Colors.black.withOpacity(0.1),
                  ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Topicons(),
                        const SizedBox(
                          height: 25.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Topsection(onpresse: () {}, text: 'TV shows'),
                            Topsection(onpresse: () {}, text: 'Movies'),
                            Topsection(onpresse: () {}, text: 'Categories')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  nowvalue() async {
    final Data = await getallData(catory: "upcoming");
    final Data1 = await getallData(catory: "popular");
    final Data2 = await getallData(catory: "top_rated");
    setState(() {
      Listofmovies = Data;
      Listofmovies1 = Data1;
      Listofmovies2 = Data2;
    });
  }
}
