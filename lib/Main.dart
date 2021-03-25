import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/ui/App.dart';

import 'bloc/BlocObserver.dart';


void main() {
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = MBlocObserver();
  runApp(MyApp());
}