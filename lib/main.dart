import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dp_app/screens/home.dart';
import 'package:to_dp_app/sqlite/note_layout.dart';
import 'package:to_dp_app/test_bloc/bloc/bloc.dart';
import 'package:to_dp_app/test_bloc/bloc/layout_bloc_test.dart';
import 'package:to_dp_app/test_bloc/counter_cubit.dart';
import 'package:to_dp_app/test_bloc/person.dart';
import 'package:to_dp_app/test_bloc/test.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocProvider(
          create: (_) => PersonBloc(person: Person(name: "Minh", age: 12)),
          child: Center(
            child: PersonView(),
          ),
        ),
      ),
    );
  }
}
