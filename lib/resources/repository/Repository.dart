import 'package:flutter_demo_app/models/Photo.dart';
import 'package:flutter_demo_app/resources/provider/PhotoProvider.dart';

class Repository {
  final photosApiProvider = PhotoApiProvider();
  Future<List<Photo>> fetch() => photosApiProvider.fetchPhotos();
}