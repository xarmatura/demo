import 'package:equatable/equatable.dart';
import 'package:flutter_demo_app/models/Photo.dart';

enum PostStatus { initial, success, failure }

class PhotoState extends Equatable {
  const PhotoState({
    this.status = PostStatus.initial,
    this.photos = const <Photo>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<Photo> photos;
  final bool hasReachedMax;

  PhotoState copyWith({
    PostStatus? status,
    List<Photo>? photos,
    bool? hasReachedMax,
  }) {
    return PhotoState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PhotoState { status: $status, hasReachedMax: $hasReachedMax, posts: ${photos.length} }''';
  }

  @override
  List<Object> get props => [status, photos, hasReachedMax];
}