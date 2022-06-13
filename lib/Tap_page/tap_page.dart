import 'package:flutter/material.dart';
import 'package:netflixe_tdm/moviedatabase/moviedatabase.dart';

class Detailed extends StatelessWidget {
  Detailed({Key? key, required this.index, required this.Data})
      : super(key: key);
  int index;
  List<Moviedatabase> Data;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${Data[index].posterPath}'),
                          ),
                        ),
                      ),
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Colors.black.withOpacity(0.85),
                              Colors.black.withOpacity(0.1),
                            ],
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter)),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      size: 23,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border_rounded,
                                      size: 23,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 100,
                      width: 250,
                      child: Text(
                        Data[index].title!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 50),
                    child: Row(
                      children: [
                        ElevatedButton.icon(
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_circle,
                              size: 23,
                              color: Colors.black,
                            ),
                            label: const Text(
                              "Paly",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: size.width - 100,
                      child: Text(
                        Data[index].releaseDate!,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      Data[index].voteAverage.toString(),
                      style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  Data[index].overview!,
                  style: const TextStyle(color: Colors.white54),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
