import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweet_memo/main.dart';
import 'package:tweet_memo/presentation/components/add_todo.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: Column(
        children: [
          AddTodoWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.text),
                  subtitle: Text(post.createdAt.getRelativeTime()),
                  trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => ref
                          .read(postNotifierProvider.notifier)
                          .removeTodo(post.id!)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
