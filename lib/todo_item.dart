import 'package:flutter/material.dart';
import 'package:todo/todo.dart';


class TodoItem extends StatefulWidget {
  final Todo item;
  final ValueChanged<Todo> onChanged;

  TodoItem({ this.item, this.onChanged });

  _TodoItemState createState() => _TodoItemState(item.state);
}

class _TodoItemState extends State<TodoItem> {
  TodoState _state;

  _TodoItemState(this._state);

  Widget _buildCheckbox() {
    return Checkbox(
      value: (_state == TodoState.COMPLETED),
      onChanged: (bool newValue) {
        setState(() {
          _state = newValue ? TodoState.COMPLETED : TodoState.INCOMPLETE;
        });

        widget.item.state = _state;
        widget.onChanged(widget.item);
      },
    );
  }

  Widget _buildText() {
    return Expanded(
      child: Text(
        widget.item.text,
        style: (_state == TodoState.INCOMPLETE) ? null : TextStyle(
          decoration: TextDecoration.lineThrough,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          _buildCheckbox(),
          _buildText(),
        ],
      ),
    );
  }
}
