import 'package:tweet_memo/domain/model/vo/datetime.dart';

class TodoItem {
  final String id;
  final String text;
  final DateTimeValue createdAt;

  TodoItem({ required this.id,  required this.text, required this.createdAt});
}
