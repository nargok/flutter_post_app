import 'package:tweet_memo/domain/model/vo/datetime.dart';

class PostItem {
  final int? id;
  final String text;
  final DateTimeValue createdAt;

  PostItem({this.id, required this.text, required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'created_at': createdAt.datetime.toIso8601String(),
    };
  }

  factory PostItem.fromMap(Map<String, dynamic> map) {
    return PostItem(
      id: map['id'],
      text: map['text'],
      createdAt: DateTimeValue(DateTime.parse(map['created_at'])),
    );
  }

  PostItem copyWith({
    int? id,
    String? text,
    DateTimeValue? createdAt,
  }) {
    return PostItem(
        id: id ?? this.id,
        text: text ?? this.text,
        createdAt: createdAt ?? this.createdAt);
  }
}
