import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:to_dp_app/gen/assets.gen.dart';
import 'package:to_dp_app/life_cycle/test_life_cycle.dart';
import 'package:to_dp_app/reponsive_widget/responsive/screen_responsive.dart';
import 'package:to_dp_app/screens/home.dart';
import 'package:to_dp_app/sqlite/note_layout.dart';
import 'package:to_dp_app/test_bloc/bloc/bloc.dart';
import 'package:to_dp_app/test_bloc/bloc/layout_bloc_test.dart';
import 'package:to_dp_app/test_bloc/counter_cubit.dart';
import 'package:to_dp_app/test_bloc/person.dart';
import 'package:to_dp_app/test_bloc/test.dart';
import 'package:to_dp_app/test_route/route_app_screen.dart';

import 'clean_archi/di.dart';
import 'custom_screen/custom_silver_appbar.dart';
import 'custom_screen/vinhome_city/home_page_vin.dart';
import 'notification/notification_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize(); // init screen

  await configureDependencies(); // init di

  await AwesomeNotifications().initialize(
      //icon
      null,
      //đăng ký chanel
      [
        NotificationChannel(
            channelGroupKey: 'to_do_chanel_group',
            channelKey: 'to_do',
            channelName: 'ToDo Notification',
            channelDescription: 'To do notification description')
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'to_do_chanel_group',
            channelGroupName: 'to to group')
      ]);

  //kiểm tra có cho gửi noti
  bool isAllowSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  print("sendNotification: $isAllowSendNotification");

  //yêu cầu được gửi noti
  if (!isAllowSendNotification) {
    print("sendNotification: $isAllowSendNotification");
    AwesomeNotifications().requestPermissionToSendNotifications();
  }

  runApp( RouteApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    print('width: ${MediaQuery.of(context).size.width}');
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: CustomSilverAppBar()),
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
