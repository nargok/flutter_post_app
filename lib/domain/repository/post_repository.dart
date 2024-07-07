import 'package:tweet_memo/domain/model/post_item.dart';

abstract class PostRepository {
  Future<PostItem> register(PostItem post);

  Future<List<PostItem>> getPosts();

  Future<int> delete(int id);
}
