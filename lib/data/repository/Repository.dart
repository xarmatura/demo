import 'package:flutter_demo_app/models/Photo.dart';
import 'package:flutter_demo_app/data/provider/PhotoProvider.dart';

class Repository {
  var _photosApiProvider = PhotoApiProvider();
  Future<List<Photo>> fetch([int start = 0]) {
    return _photosApiProvider.fetchPhotos(start);
  }
}