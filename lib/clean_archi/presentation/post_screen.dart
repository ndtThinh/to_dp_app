import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dp_app/clean_archi/presentation/bloc/post_bloc_clean.dart';
import 'package:to_dp_app/clean_archi/presentation/bloc/post_event_clean.dart';
import 'package:to_dp_app/clean_archi/presentation/bloc/post_state_clean.dart';

class PostScreenBlocClean extends StatefulWidget {
  @override
  State<PostScreenBlocClean> createState() => _PostScreenBlocCleanState();
}

class _PostScreenBlocCleanState extends State<PostScreenBlocClean> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      print('Run postFectched');
      context.read<PostBlocClean>().add(PostFetchedClean());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    var maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll == (maxScroll);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Call APi Clean Arch ",
          style: TextStyle(fontFamily: 'DancingFont'),
        ),
      ),
      body:
          BlocBuilder<PostBlocClean, PostStateClean>(builder: (context, state) {
        if (state.status == PostStatusClean.initial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == PostStatusClean.failure) {
          return const Text(
            "Erorr call api",
            style: TextStyle(
                color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
          );
        } else {
          return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReacheMax
                  ? state.posts.length
                  : state.posts.length + 1,
              itemBuilder: (context, index) {
                if (index >= state.posts.length) {
                  print("state has size full: ${state.hasReacheMax}");
                  return BottomLoader();
                } else {
                  return Card(
                    color: Colors.pink,
                    child: ListTile(
                      title: Text(
                        '${state.posts[index].title}',
                        style: const TextStyle(
                            fontFamily: 'dancingFont',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      subtitle: Text('${state.posts[index].body}',
                          style: const TextStyle(
                              fontFamily: 'dancingFont',
                              color: Colors.white,
                              fontSize: 17)),
                    ),
                  );
                }
              });
        }
      }),
    ));
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
