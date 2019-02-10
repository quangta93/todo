import 'package:flutter/material.dart';
import 'package:todo/todo.dart';
import 'package:todo/todo_item.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = List<Todo>();

  @override
  void initState() {
    super.initState();

    todos.add(Todo.create('trash'));
    todos.add(Todo.create('clean cup'));
    todos.add(Todo.create('shower'));
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
            print('todos[$index] = ${_item.toString()}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('pressed');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
