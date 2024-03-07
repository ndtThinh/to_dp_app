import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_dp_app/models/to_do.dart';
import 'package:to_dp_app/widgets/item_to_do.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listTodo = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _toDoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _foundToDo = listTodo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      appBar: _buildAppbar(),
      drawer: const Drawer(
        backgroundColor: Colors.amberAccent,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Column(
              children: [
                _searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: const Text(
                          "All to do",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (ToDo item in _foundToDo)
                        ItemToDo(item, _handleToDoChange, _deletItemToDo)
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0)
                        ]),
                    child: TextField(
                      controller: _toDoController,
                      decoration: const InputDecoration(
                          hintText: "Add new todo item",
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToList(_toDoController.text);
                      print('size: ${listTodo.length}');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("To Do App"),
          ClipOval(
            child: Image(
                width: 45,
                height: 45,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/pikachu.jpg')),
          )
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            )),
      ),
    );
  }

  void _handleToDoChange(ToDo mToDo) {
    setState(() {
      mToDo.done = !mToDo.done!;
    });
  }

  void _deletItemToDo(String id) {
    setState(() {
      listTodo.removeWhere((element) => element.id == id);
    });
  }

  void _addToList(String value) {
    setState(() {
      listTodo.add(ToDo(DateTime.now().second.toString() as int, value, false));
    });
    _toDoController.clear();
  }

  void _runFilter(String enterKey) {
    List<ToDo> results = [];
    if (enterKey.isEmpty) {
      results = listTodo;
    } else {
      results = listTodo
          .where((element) =>
              element.title!.toLowerCase().contains(enterKey.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }
}
