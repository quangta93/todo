
enum TodoState {
  INCOMPLETE,
  COMPLETED,
  // ARCHIVED,
}

class Todo {
  static int counter = 0;

  final int id;
  String text;
  TodoState state;

  Todo(this.text, this.state) :
    assert(text != null && text.isNotEmpty),
    assert(state != null),
    id = Todo.counter++;

  Todo.create(this.text) :
    id = Todo.counter++,
    state = TodoState.INCOMPLETE;

  @override
  String toString() {
    return 'id = $id; state = $state; text = $text';
  }
}
