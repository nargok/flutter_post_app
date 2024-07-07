import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweet_memo/application/providers/post_provider.dart';
import 'package:tweet_memo/domain/model/post_item.dart';
import 'package:tweet_memo/domain/repository/post_repository.dart';
import 'package:tweet_memo/infrastructure/post_repository.dart';
import 'package:tweet_memo/presentation/todo_list_screen.dart';

void main() {
  runApp(
    const ProviderScope(child: TodoApp())
  );
}


class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoList(),
    );
  }
}

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepositoryImpl();
});

final postNotifierProvider = StateNotifierProvider<PostNotifier, List<PostItem>>((ref) {
  final repository = ref.watch(postRepositoryProvider);
  return PostNotifier(repository);
});
