import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../data/repository/Repository.dart';
import 'PhotoEvent.dart';
import 'PhotoState.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final Repository? repository;

  PhotoBloc({this.repository}) : super(const PhotoState());

  @override
  Stream<Transition<PhotoEvent, PhotoState>> transformEvents(Stream<PhotoEvent> events,
      TransitionFunction<PhotoEvent, PhotoState> transitionFn) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    if (event is PhotoFetched) {
      yield await _mapFetchedToState(state);
    }
  }

  Future<PhotoState> _mapFetchedToState(PhotoState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == PhotoStatus.initial) {
        final photos = await repository!.fetch();
        return state.copyWith(
          status: PhotoStatus.success,
          photos: photos,
          hasReachedMax: false,
        );
      }
      final photos = await repository!.fetch(state.photos.length);
      return photos.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PhotoStatus.success,
              photos: List.of(state.photos)..addAll(photos),
              hasReachedMax: false,
            );
    } on Exception {
      return state.copyWith(status: PhotoStatus.failure);
    }
  }
}

