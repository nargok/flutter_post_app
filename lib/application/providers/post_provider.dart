import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweet_memo/domain/model/post_item.dart';
import 'package:tweet_memo/domain/model/vo/datetime.dart';
import 'package:tweet_memo/domain/repository/post_repository.dart';

class PostNotifier extends StateNotifier<List<PostItem>> {
  final PostRepository _repository;

  PostNotifier(this._repository) : super([]) {
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final posts = await _repository.getPosts();
    state = posts;
  }

  void addTodo(String text) async {
    final post = PostItem(text: text, createdAt: DateTimeValue(DateTime.now()));
    final savedPost = await _repository.register(post);
    state = [savedPost, ...state];
  }

  void removeTodo(int id) async {
    await _repository.delete(id);
    state = state.where((element) => element.id != id).toList();
  }
}

