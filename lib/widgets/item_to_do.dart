import 'package:flutter/material.dart';
import 'package:to_dp_app/models/to_do.dart';

class ItemToDo extends StatelessWidget {
  final ToDo mToDo;
  final onToDoChange;
  final onToDoDelete;

  const ItemToDo(this.mToDo, this.onToDoChange, this.onToDoDelete, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        onTap: () {
          //on tap in here
          onToDoChange(mToDo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: Colors.white,
        leading: Icon(
          mToDo.done!
              ? Icons.check_box
              : Icons.check_box_outline_blank_outlined,
          color: Colors.blue,
        ),
        title: Text(
          mToDo.title!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              decoration: mToDo.done! ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: IconButton(
            onPressed: () {
              onToDoDelete(mToDo.id);
            },
            icon: const Icon(
              Icons.delete,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
