import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_dp_app/custom_screen/fade_animation.dart';
import 'package:to_dp_app/gen/assets.gen.dart';

class OneUiNestScrollView extends StatefulWidget {
  final double? expandedHeight;
  final double? toolBarHeight;
  final Widget expandedWidget;
  final Widget? collapseWidget;
  final BoxDecoration? boxDecoration;
  final Widget? leadingIcon;
  final List<Widget> actions;
  final SliverList sliverList;
  final Color? sliverBackGroundColor;

  const OneUiNestScrollView(
      {super.key,
      this.expandedHeight,
      this.toolBarHeight,
      required this.expandedWidget,
      this.boxDecoration,
      this.collapseWidget,
      this.leadingIcon,
      required this.actions,
      required this.sliverList,
      this.sliverBackGroundColor});

  @override
  State<OneUiNestScrollView> createState() => _OneUiNestScrollViewState();
}

class _OneUiNestScrollViewState extends State<OneUiNestScrollView> {
  late double _expandedHeight;
  late double _toolBarHeight;

  double calculateExpandedRatio(BoxConstraints constraints) {
    var expandedRatio = (constraints.maxHeight - _toolBarHeight) /
        (_expandedHeight - _toolBarHeight);
    if (expandedRatio > 1.0) expandedRatio = 1;
    if (expandedRatio < 0.0) expandedRatio = 0;
    return expandedRatio;
  }

  List<Widget> headerSliverBuilder(context, innerBoxIsScrolled) {
    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          backgroundColor: Colors.deepOrange,
          expandedHeight: _expandedHeight,
          pinned: true,
          toolbarHeight: _toolBarHeight,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final expandedRatio = calculateExpandedRatio(constraints);
              final animation = AlwaysStoppedAnimation(expandedRatio);

              return Stack(
                children: [
                  Container(decoration: widget.boxDecoration),
                  if (widget.expandedWidget != null)
                    Center(
                        child: FadeAnimation(
                      animation: animation,
                      isExpandedWidget: true,
                      child: widget.expandedWidget!,
                    )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      width: 300,
                      height: 100,
                      child: Align(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            menuItem(),
                            menuItem(),
                            menuItem(),
                            menuItem(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      )
    ];
  }

// class _OneUiNestScrollViewState extends State<OneUiNestScrollView> {
//   late double _expandedHeight;
//   late double _toolBarHeight;
//
//   double calculateExpandedRatio(BoxConstraints constraints) {
//     var expandedRatio = (constraints.maxHeight - _toolBarHeight) /
//         (_expandedHeight - _toolBarHeight);
//     if (expandedRatio > 1.0) expandedRatio = 1;
//     if (expandedRatio < 0.0) expandedRatio = 0;
//     return expandedRatio;
//   }
//
//   List<Widget> headerSliverBuilder(context, innerBoxIsScrolled) {
//     return [
//       SliverOverlapAbsorber(
//         handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//         sliver: SliverAppBar(
//           backgroundColor: Colors.deepOrange,
//           expandedHeight: _expandedHeight,
//           pinned: true,
//           toolbarHeight: _toolBarHeight,
//           flexibleSpace: LayoutBuilder(
//             builder: (context, constraints) {
//               final expandedRatio = calculateExpandedRatio(constraints);
//               final animation = AlwaysStoppedAnimation(expandedRatio);
//
//               return Stack(
//                 children: [
//                   Container(decoration: widget.boxDecoration),
//                   if (widget.expandedWidget != null)
//                     Center(
//                         child: FadeAnimation(
//                       animation: animation,
//                       isExpandedWidget: true,
//                       child: Assets.images.pikachu.image(
//                           fit: BoxFit.fill,
//                           height: _expandedHeight,
//                           width: double.infinity),
//                     )
// // child: widget.expandedWidget!),
//                         ),
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: SizedBox(
//                       height: _toolBarHeight,
//                       child: Row(
//                         children: [
//                           if (widget.leadingIcon != null) widget.leadingIcon!,
//                           if (widget.collapseWidget != null)
//                             Padding(
//                               padding: EdgeInsets.only(
//                                   left: widget.leadingIcon != null ? 0 : 20),
//                               child: FadeAnimation(
//                                   animation: animation,
//                                   isExpandedWidget: false,
//                                   child: widget.collapseWidget!),
//                             ),
//                           if (widget.actions != null)
//                             Expanded(
//                                 child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: widget.actions!.reversed.toList(),
//                             ))
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               );
//             },
//           ),
//         ),
//       )
//     ];
//   }

  Widget body() {
    return Container(
      color: widget.sliverBackGroundColor ??
          Theme.of(context).scaffoldBackgroundColor,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
              widget.sliverList
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _expandedHeight =
        widget.expandedHeight ?? MediaQuery.of(context).size.width * 3 / 8;
    _toolBarHeight = widget.toolBarHeight ?? kToolbarHeight;
    return NestedScrollView(
        headerSliverBuilder: headerSliverBuilder, body: body());
  }

  Widget customAppbar() {
    return SizedBox(
      width: double.infinity,
      height: _expandedHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.pink,
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.white,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 70,
            width: 300,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

Widget menuItem() {
  return Column(children: [
    ClipOval(
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color.fromRGBO(208, 199, 199, 1.0)),
        child: Icon(Icons.cake_outlined),
      ),
    ),
  ]);
}
