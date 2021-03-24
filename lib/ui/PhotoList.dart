import 'package:flutter/material.dart';
import 'package:flutter_demo_app/models/Photo.dart';

class PhotoList extends StatelessWidget {
  final List<Photo>? photos;

  PhotoList({Key? key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: photos!.length,
      itemBuilder: (context, index) {
        return Image.network(photos![index].thumbnailUrl);
      },
    );
  }
}
