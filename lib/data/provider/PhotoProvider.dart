import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_demo_app/models/Photo.dart';
import 'package:http/http.dart' as http;

const _postLimit = 15;
class PhotoApiProvider {
  Future<List<Photo>> fetchPhotos([int startIndex = 0]) async {
    final response = await http.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/photos',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
      ),
    );
    // compute to run parsePhotos in a separate isolate.
    return compute(parsePhotos, response.body);
  }
}

List<Photo> parsePhotos(String responseBody) {
  // convert a response body into a List<Photo>.
  List<dynamic> photoJson = jsonDecode(responseBody);
  // final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return photoJson.map<Photo>((json) => Photo.fromJson(json)).toList();
}
