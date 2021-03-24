import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_demo_app/models/Photo.dart';
import 'package:http/http.dart' as http;

class PhotoApiProvider {
  Future<List<Photo>> fetchPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    // compute to run parsePhotos in a separate isolate.
    return compute(parsePhotos, response.body);
  }
}

List<Photo> parsePhotos(String responseBody) {
  // convert a response body into a List<Photo>.
  var list = Map<String, dynamic>();
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}
