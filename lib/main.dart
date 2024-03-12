import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dp_app/call_api/api_screen.dart';
import 'package:to_dp_app/call_api/bloc/bloc_screen.dart';
import 'package:to_dp_app/call_api/bloc/post_bloc.dart';
import 'package:to_dp_app/call_api/bloc/post_event.dart';
import 'package:to_dp_app/clean_archi/data/remote/api/post_api_impl.dart';
import 'package:to_dp_app/clean_archi/data/repository/post_repository_empl.dart';
import 'package:to_dp_app/clean_archi/domain/usercase/post_usecae.dart';
import 'package:to_dp_app/clean_archi/presentation/bloc/post_bloc_clean.dart';
import 'package:to_dp_app/clean_archi/presentation/bloc/post_event_clean.dart';
import 'package:to_dp_app/clean_archi/presentation/post_screen.dart';
import 'package:to_dp_app/reponsive_widget/responsive/screen_responsive.dart';
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
      home: Scaffold(body: LayoutNotePage()),
    );
  }

//bloc clean archi
  Widget bodyBlocCleanApi() {
    Dio dio = Dio();
    return BlocProvider(
      create: (_) => PostBlocClean(
          postUseCase: PostUseCase(
              repo: PostRepositoryEmpl(postApi: PostApiEmpl(dio: dio))))
        ..add(PostFetchedClean()),
      child: Center(
        child: PostScreenBlocClean(),
      ),
    );
  }

//bloc api
  Widget bodyBlocApi() {
    Dio dio = Dio();
    return BlocProvider(
      create: (_) => PostBloc(dio: dio)..add(PostFetched()),
      child: Center(
        child: DioDartBloc(),
      ),
    );
  }

//test bloc
  Widget bodyBloc() {
    return BlocProvider(
      create: (_) => PersonBloc(person: Person(name: "Minh", age: 12)),
      child: const Center(
        child: PersonView(),
      ),
    );
  }

  //image
  Widget imageWidget() {
    return const Image(image: AssetImage('assets/images/pikachu.jpg'));
  }
}
