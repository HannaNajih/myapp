import 'dart:convert';

import 'user_model.dart';

class Task {
  int? id;
  String? title;
  String? note;
  int? isComplete;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remaind;
  String? repeate;
  UserModel? user;
  Task({
    this.id,
    this.title,
    this.note,
    this.isComplete,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remaind,
    this.repeate,
    this.user,
  });
  Task copyWith({
    int? id,
    String? title,
    String? note,
    int? isComplete,
    String? date,
    String? startTime,
    String? endTime,
    int? color,
    int? remaind,
    String? repeate,
    UserModel? user,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      isComplete: isComplete ?? this.isComplete,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      color: color ?? this.color,
      remaind: remaind ?? this.remaind,
      repeate: repeate ?? this.repeate,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'isComplete': isComplete,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'remaind': remaind,
      'repeate': repeate,
      'user': user!.toMap(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      id: map['id'] ?? 'no id',
      note: map['note'] ?? '',
      date: map['date'] ?? DateTime.fromMillisecondsSinceEpoch(map['date']),
      startTime: map['startTime'],
      endTime: map['endTime'] ?? '',
      remaind: map['remaind'] ?? '',
      repeate:
          map['repeate'] ?? '', //fromMap(map['user'].cast<String, dynamic>()),
      user: UserModel.fromMapp(
        map['user'].cast<String, dynamic>(),
      ),
    );
  }
  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(id: $id, title: $title, note: $note, startTime: $startTime, ensTime: $endTime, date: $date, repeate: $repeate, remaind: $remaind, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.title == title &&
        other.note == note &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.date == date &&
        other.remaind == remaind &&
        other.repeate == repeate &&
        other.user == user;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        note.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        date.hashCode ^
        repeate.hashCode ^
        remaind.hashCode ^
        user.hashCode;
  }
}
