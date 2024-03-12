import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:to_dp_app/call_api/post_model.dart';

class LayoutApi extends StatefulWidget {
  const LayoutApi({super.key});

  @override
  State<LayoutApi> createState() => _LayoutApiState();
}

class _LayoutApiState extends State<LayoutApi> {
  final Future<String> _cal =
      Future<String>.delayed(const Duration(seconds: 10), () => "Xin chao");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: FutureBuilder(
              future: _cal,
              builder: (context, snapshot) {
                List<Widget> childrent;
                if (snapshot.hasData) {
                  childrent = <Widget>[
                    const Icon(
                      Icons.done_outline,
                      size: 40,
                      color: Colors.green,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('Result: ${snapshot.data.toString()}'),
                    )
                  ];
                } else if (snapshot.hasError) {
                  childrent = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ];
                } else {
                  childrent = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }

                return Center(
                  child: Column(
                    children: childrent,
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class DioDart extends StatelessWidget {
  Future<List<Post>> fetchApi() async {
    Dio dio = Dio();
    var respone = await dio.get('https://jsonplaceholder.typicode.com/posts');

    final List<dynamic> responeData = respone.data;
    List<Post> posts = responeData.map((e) => Post.fromJson(e)).toList();
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Call APi"),
      ),
      body: FutureBuilder<List<Post>>(
          future: fetchApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('${snapshot.data![index].title}'),
                        subtitle: Text('${snapshot.data![index].body}'),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return const Text('Call Api Error');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    ));
  }
}
