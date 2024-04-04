import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_dp_app/call_api/bloc/bloc_screen.dart';
import 'package:to_dp_app/call_api/bloc/post_bloc.dart';
import 'package:to_dp_app/call_api/bloc/post_event.dart';
import 'package:to_dp_app/clean_archi/presentation/bloc/post_bloc_clean.dart';
import 'package:to_dp_app/clean_archi/presentation/bloc/post_event_clean.dart';
import 'package:to_dp_app/clean_archi/presentation/post_screen.dart';
import 'package:to_dp_app/notification_one_signal/notification_config/notification_config.dart';
import 'package:to_dp_app/notification_one_signal/notification_screen_onesignal.dart';
import 'package:to_dp_app/test_bloc/bloc/bloc.dart';
import 'package:to_dp_app/test_bloc/bloc/layout_bloc_test.dart';
import 'package:to_dp_app/test_bloc/person.dart';

import 'clean_archi/di.dart';

import 'notification_one_signal/navigatior_utils.dart';


void main() async {
  await ScreenUtil.ensureScreenSize(); // init screen

  await configureDependencies(); // init di


  NotificationConfig.initNotification();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int number = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('width: ${MediaQuery.of(context).size.width}');
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      navigatorKey: NavigationUtils.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const NotificationScreenOneSignal(),
      // home: Scaffold(
      //     appBar: AppBar(actions: [
      //       IconButton(
      //           onPressed: () {
      //             setState(() {
      //               number++;
      //             });
      //           },
      //           icon: Icon(Icons.add))
      //     ]),
      //     body: TestLife(
      //       numberStateFull: number,
      //     )),
    );
  }

//bloc clean archi
  Widget bodyBlocCleanApi() {
    // Dio dio = Dio();
    return BlocProvider(
      create: (_) => PostBlocClean()..add(PostFetchedClean()),
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

  //test flutter_screenutil
  Widget TestFlutterScreenUntil() {
    return ScreenUtilInit(
      builder: (_, child) {
        print('r: ${120.w}');
        child:
        return SafeArea(
          child: Column(
            children: [
              Container(
                width: 360.w,
                height: 100.h,
                color: Colors.purple,
              ),
            ],
          ),
        );
      },
    );
  }
}
