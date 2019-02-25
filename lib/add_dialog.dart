import 'package:flutter/material.dart';


enum ConfirmAction { cancel, add }

class AddDialog extends StatefulWidget {
  final Function onAdd;

  AddDialog({ this.onAdd });

  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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

            if (widget.onAdd != null) {
              widget.onAdd(text);
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

