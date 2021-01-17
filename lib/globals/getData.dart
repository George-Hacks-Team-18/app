import 'package:http/http.dart' as http;

import 'dart:convert';

Future fetchAlbum() async {
  final response = await http
      .get('http://ec2-52-4-221-100.compute-1.amazonaws.com/api/getData');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var json = jsonDecode(response.body);
    var body = json['data'];
    return body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
