import 'package:flutter/material.dart';
import 'package:todo/todo.dart';
import 'package:todo/todo_item.dart';


enum ConfirmAction { cancel, add }

class HomeScreen extends StatefulWidget {
  HomeScreen({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  List<Todo> todos = List<Todo>();

  Future _showAddDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Todo Item'),
        content: TextField(
          controller: controller,
          autofocus: true,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              controller.clear();
              Navigator.of(context).pop(ConfirmAction.cancel);
            },
          ),
          FlatButton(
            child: Text('Add'),
            onPressed: () {
              final text = controller.text;
              controller.clear();
              Navigator.of(context).pop(ConfirmAction.add);

              setState(() {
                final item = Todo.create(text);
                todos.add(item);
              });
            },
          ),
        ],
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

  @override
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
