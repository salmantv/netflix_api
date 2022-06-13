import 'package:flutter/material.dart';
import 'package:netflixe_tdm/ComingSoon/mainframes.dart';
import 'package:netflixe_tdm/moviedatabase/moviedatabase.dart';

class Geranter extends StatelessWidget {
  Geranter({Key? key, required this.index, required this.data})
      : super(key: key);
  int index;
  List<Moviedatabase> data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            children: [
              Container(
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${data[index].backdropPath}',
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
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: SizedBox(
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          data[index].title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: const [
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.info,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Info",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
        Mainfram(
          data: data,
          index: index,
          color: Colors.white.withOpacity(0.5),
          fontsize: 16,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
