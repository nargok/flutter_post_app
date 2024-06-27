import 'package:tweet_memo/domain/model/vo/datetime.dart';

class TodoItem {
  final String text;
  final DateTimeValue createdAt;

  TodoItem(this.text, this.createdAt);
}
