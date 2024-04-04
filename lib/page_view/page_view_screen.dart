import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_dp_app/page_view/home_page_model.dart';
import 'package:to_dp_app/page_view/pages/account_page.dart';
import 'package:to_dp_app/page_view/pages/page_home.dart';

import '../gen/assets.gen.dart';
import 'bottom_bar_widget.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  late PageController pageController;
  late ValueNotifier<int> currentIndex;

  final listPage = [
    HomePageModel(
      name: "home",
      selectedIconUrl: Assets.icons.icHomeFilled.path,
      unselectedIconUrl: Assets.icons.icHomeOutlined.path,
      child: const HomePageView(),
    ),
    HomePageModel(
      name: "account",
      selectedIconUrl: Assets.icons.icUserFilled.path,
      unselectedIconUrl: Assets.icons.icUserOutlined.path,
      child: const AccountPageView(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = ValueNotifier<int>(0);
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
          designSize:const Size(400, 690),
          builder: (_, __) => Scaffold(body: body())),
    );
  }

  Widget body() {
    return Column(
      children: [
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: listPage
                .map((e) => SafeArea(bottom: false, child: e.child))
                .toList(),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (_, value, __) => BottomBarWidget(
            currentIndex: value,
            listPage: listPage,
            onTap: (index) {
              currentIndex.value = index;
              pageController.jumpToPage(index);
            },
          ),
        ),
      ],
    );
  }
}
