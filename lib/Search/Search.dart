import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixe_tdm/Functions/function.dart';
import 'package:netflixe_tdm/moviedatabase/moviedatabase.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Moviedatabase> Movielist = [];

  @override
  void initState() {
    super.initState();
    Dategeting();
  }

  Dategeting() async {
    final Data1 = await getallData(catory: "popular");
    setState(() {
      Movielist = Data1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Movielist.isEmpty
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
              toolbarHeight: 70,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CupertinoTextField(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      placeholder: "   Search",
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 25, right: 18),
                    child: Text(
                      "Top  Searches",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                      children: List.generate(Movielist.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: (size.width - 36) * 0.8,
                            height: 90,
                            child: Row(children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 140,
                                    width: 120,
                                    child: ClipRRect(
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500${Movielist[index].backdropPath}',
                                        frameBuilder:
                                            (context, child, frame, Was) {
                                          return child;
                                        },
                                        loadingBuilder: (contx, child, loding) {
                                          if (loding == null) {
                                            return child;
                                          } else {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: (size.width - 36) * 0.4,
                                child: Text(
                                  Movielist[index].originalTitle!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ]),
                          ),
                          SizedBox(
                            width: (size.width - 36) * 0.2,
                            height: 90,
                            child: Center(
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                                child: const Center(
                                  child: Icon(Icons.play_arrow),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }))
                ],
              )),
            ),
          );
  }
}
