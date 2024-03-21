import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:to_dp_app/test_route/bloc/bloc_page.dart';
import 'package:to_dp_app/test_route/page/page_one.dart';
import 'package:to_dp_app/test_route/page/page_three.dart';
import 'package:to_dp_app/test_route/page/page_two.dart';
import 'package:to_dp_app/test_route/routes/route_name.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings routeSettings) {
    final argument = routeSettings.arguments;
    Widget routeWidget = BlocProvider(
      create: (context) => PageOneCubit(),
      child: const PageOne(),
    );

    switch (routeSettings.name) {
      case RouteName.page1:
        routeWidget = BlocProvider(
          create: (context) => PageOneCubit(),
          child: const PageOne(),
        );
        break;
      case RouteName.page2:
        routeWidget = BlocProvider(
            create: (context) => PageTwoCubit(),
            child: PageTwo(
              strArgument: argument as String,
            ));
        break;
      case RouteName.page3:
        routeWidget = BlocProvider(
          create: (context) => PageThreeCubit(),
          child: const PageThree(),
        );
      default:
        routeWidget = BlocProvider(
          create: (context) => PageOneCubit(),
          child: const PageOne(),
        );
        break;
    }

    return MaterialPageRoute(
        builder: (_) => routeWidget, settings: routeSettings);
  }
}
