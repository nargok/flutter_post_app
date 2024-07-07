import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweet_memo/domain/model/todo_item.dart';
import 'package:tweet_memo/domain/model/vo/datetime.dart';

class TodoNotifier extends StateNotifier<List<TodoItem>> {
  TodoNotifier() : super([]);

  void addTodo(String text) {
    state = [
      TodoItem(
        id: DateTime.now().toString(),
        text: text,
        createdAt: DateTimeValue(DateTime.now()),
      ),
      ...state,
    ];
  }

  void removeTodo(String id) {
    state = state.where((element) => element.id != id).toList();
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<TodoItem>>((ref) {
  return TodoNotifier();
});
