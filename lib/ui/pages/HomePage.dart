import 'package:flutter/material.dart';
import 'package:flutter_demo_app/bloc/PhotoBloc.dart';
import 'package:flutter_demo_app/models/Photo.dart';

import '../PhotoList.dart';

class HomePage extends StatelessWidget {
  final String? title;

  HomePage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        backgroundColor: Colors.deepPurpleAccent,
        textTheme: TextTheme(
          headline6: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal
          ),
        )
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            print('print');
          },
          child: FutureBuilder<List<Photo>>(
            future: bloc.fetchAllPhotos(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? PhotoList(photos: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
