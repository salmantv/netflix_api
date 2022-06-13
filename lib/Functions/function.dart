import 'dart:convert';

import 'package:netflixe_tdm/moviedatabase/moviedatabase.dart';
import 'package:http/http.dart' as http;

Future<List<Moviedatabase>> getallData({required String catory}) async {
  final _respons = await http.get(Uri.parse(
      "https://api.themoviedb.org/3/movie/$catory?api_key=1ae65d4b2ef21c8d43dae0760c8c7598"));
  if (_respons.statusCode == 200) {
    final bodyjoson = await jsonDecode(_respons.body);
    Iterable list = await bodyjoson['results'];
    return list.map((element) => Moviedatabase.fromJson(element)).toList();
  } else {
    throw Exception("No Data get");
  }
}
