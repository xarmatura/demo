import 'package:flutter_demo_app/models/Photo.dart';
import 'package:flutter_demo_app/resources/provider/PhotoApiProvider.dart';

class Repository {
  final photosApiProvider = PhotoApiProvider();
  Future<List<Photo>> fetchAllPhotos() => photosApiProvider.fetchPhotos();
}