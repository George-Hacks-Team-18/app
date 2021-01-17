import 'package:http/http.dart' as http;

import 'dart:convert';

Future<Album> fetchAlbum() async {
  final response = await http
      .get('http://ec2-52-4-221-100.compute-1.amazonaws.com/api/getData');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String name;

  Album({this.name});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['data'].toString(),
    );
  }
}
