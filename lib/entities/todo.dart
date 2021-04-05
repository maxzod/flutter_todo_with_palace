class TodoEntity {
  final String? id;
  final String text;
  final bool isDone;
  final int priority;

  TodoEntity({
    required this.text,
    required this.priority,
    this.isDone = true,
    this.id,
  });

  TodoEntity copyWith({
    String? id,
    String? text,
    bool? isDone,
    int? priority,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      text: text ?? this.text,
      isDone: isDone ?? this.isDone,
      priority: priority ?? this.priority,
    );
  }

//1969-07-20 20:18:04Z
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'text': text,
      'isDone': isDone,
      'priority': priority,
    };
  }

  factory TodoEntity.fromMap(Map<String, dynamic> map) {
    return TodoEntity(
      id: map['_id'],
      text: map['text'],
      isDone: map['isDone'],
      priority: map['priority'],
    );
  }
}
