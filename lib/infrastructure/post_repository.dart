import 'package:tweet_memo/domain/model/post_item.dart';
import 'package:tweet_memo/domain/model/vo/datetime.dart';
import 'package:tweet_memo/domain/repository/post_repository.dart';
import 'package:tweet_memo/infrastructure/sqlite_datasoruce.dart';

class PostRepositoryImpl implements PostRepository {
  static const tableName = 'posts';
  final SqliteDatasource _datasource = SqliteDatasource.instance;

  @override
  Future<int> delete(int id) async {
    return await _datasource.delete(tableName, id);
  }

  @override
  Future<List<PostItem>> getPosts() async {
    final postMaps = await _datasource.queryRows(tableName, 100);
    return postMaps.map((map) => _mapToPostItem(map)).toList();
  }

  @override
  Future<PostItem> register(PostItem post) async {
    final id = await _datasource.insert(tableName, post.toMap());
    return post.copyWith(id: id);
  }

  PostItem _mapToPostItem(Map<String, dynamic> map) {
    return PostItem(
        id: map['id'],
        text: map['text'],
        createdAt: DateTimeValue(DateTime.parse(map['createdAt']))
    );
  }
}
