import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dp_app/call_api/bloc/post_bloc.dart';
import 'package:to_dp_app/call_api/bloc/post_event.dart';
import 'package:to_dp_app/call_api/bloc/post_state.dart';

class DioDartBloc extends StatefulWidget {
  @override
  State<DioDartBloc> createState() => _DioDartBlocState();
}

class _DioDartBlocState extends State<DioDartBloc> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Call APi "),
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state.status == PostStatus.initial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == PostStatus.failure) {
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
                      title: Text('${state.posts[index].title}'),
                      subtitle: Text('${state.posts[index].body}'),
                    ),
                  );
                }
              });
        }
      }),
    ));
  }

  void _onScroll() {
    if (_isBottom) {
      print('Run postFectched');
      context.read<PostBloc>().add(PostFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    var maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll == (maxScroll);
  }
}

//bottom loader
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
