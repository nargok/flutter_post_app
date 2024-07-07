import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweet_memo/application/providers/todo_provider.dart';

class AddTodoWidget extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  AddTodoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
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
            onPressed: () =>
                ref.read(todoProvider.notifier).addTodo(_controller.text),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
