import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/bloc/PhotoBloc.dart';
import 'package:flutter_demo_app/bloc/PhotoEvent.dart';
import 'package:flutter_demo_app/data/repository/Repository.dart';
import 'file:///C:/Users/Oleksandr.Lyshchuk/AndroidProjects/flutter_demo_app/lib/ui/view/PhotoList.dart';

class HomePage extends StatelessWidget {
  final String? title;
  final repository = Repository();
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
      body: BlocProvider(
        create: (_) => PhotoBloc(repository: repository)..add(PhotoFetched()),
        child: PhotoList(),
      )
    );
  }
}
