import 'package:flutter/material.dart';

import 'package:todo/todo.dart';
import 'package:todo/todo_item.dart';
import 'add_dialog.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = List<Todo>();

  Future _showAddDialog() async {
    showDialog(
      context: context,
      builder: (context) => AddDialog(
        onAdd: (text) => setState(() {
          final newTodo = Todo.create(text);
          todos.add(newTodo);
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => TodoItem(
          item: todos[index],
          onChanged: (Todo _item) {
            todos[index] = _item;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }
}
