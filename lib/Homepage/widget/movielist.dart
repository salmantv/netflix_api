import 'package:flutter/material.dart';
import 'package:netflixe_tdm/Tap_page/tap_page.dart';

import '../../moviedatabase/moviedatabase.dart';

class MovieList extends StatelessWidget {
  MovieList(
      {Key? key, required this.Data, required this.height, required this.width})
      : super(key: key);
  List<Moviedatabase> Data;
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
            children: List.generate(Data.length, (index) {
          return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return Detailed(
                    index: index,
                    Data: Data,
                  );
                }));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: height,
                width: width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${Data[index].posterPath}',
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
                ),
              ));
        })),
      ),
    );
  }
}
