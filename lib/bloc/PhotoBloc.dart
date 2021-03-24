import '../resources/repository/Repository.dart';


// class PhotoBloc extends Bloc<PhotoEvent, PhotoState>{
//   final _repository = Repository();
//
//   PhotoBloc(initialState) : super(initialState);
//
//   fetchAllPhotos() {
//     var photos =  _repository.fetch();
//     return photos;
//   }
//
//   @override
//   Stream<PhotoState> mapEventToState(PhotoEvent event) {
//
//     throw UnimplementedError();
//   }
//
//
// }
// final bloc = PhotoBloc();
class PhotoBloc {
  final _repository = Repository();

  fetchAllPhotos() {
    var photos =  _repository.fetch();
    return photos;
  }
}

final bloc = PhotoBloc();
