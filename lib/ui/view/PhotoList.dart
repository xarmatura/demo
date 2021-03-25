import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/bloc/PhotoBloc.dart';
import 'package:flutter_demo_app/bloc/PhotoEvent.dart';
import 'package:flutter_demo_app/bloc/PhotoState.dart';
import 'package:flutter_demo_app/ui/widgets/BottomLoader.dart';

class PhotoList extends StatefulWidget {
  @override
  _PhotoListState createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  final _scrollController = ScrollController();
  late PhotoBloc _photoBloc;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _photoBloc = context.read<PhotoBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        print(state.status);
        switch (state.status) {
          case PhotoStatus.loading:
            return Center(child: CircularProgressIndicator());
          case PhotoStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case PhotoStatus.success:
            if (state.photos.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return Stack(
              children: <Widget>[
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: state.hasReachedMax
                      ? state.photos.length
                      : state.photos.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    // debugPrint('PhotoList : ${state.photos.length}');
                    return index >= state.photos.length
                        ? Container()
                        : GridTile(
                        child: Image.network(state.photos[index].thumbnailUrl));
                  },
                  controller: _scrollController,
                ),
              ],
            );
          default:
            return Container();
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    _photoBloc.add(PhotoFetched());
  }
}
