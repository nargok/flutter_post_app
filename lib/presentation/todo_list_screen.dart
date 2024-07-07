import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweet_memo/application/providers/todo_provider.dart';
import 'package:tweet_memo/presentation/components/add_todo.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          AddTodoWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.text),
                  subtitle: Text(todo.createdAt.getRelativeTime()),
                  trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          ref.read(todoProvider.notifier).removeTodo(todo.id)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
