import 'package:flutter/material.dart';
import 'package:tweet_memo/domain/model/vo/datetime.dart';

import 'domain/model/todo_item.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoList());
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<TodoItem> _todos = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    setState(() {
      String todoText = _controller.text;
      if (todoText.isNotEmpty) {
        _todos.insert(0, TodoItem(todoText, DateTimeValue(DateTime.now())));
        _controller.clear();
      }
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a todo item',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todos[index].text),
                  subtitle: Text(_todos[index].createdAt.getRelativeTime()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeTodo(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
