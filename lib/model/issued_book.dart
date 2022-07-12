// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class IssuedBook {
  final String name;
  final String subject;
  final String date;
  IssuedBook({
    required this.name,
    required this.subject,
    required this.date,
  });

  IssuedBook copyWith({
    String? name,
    String? subject,
    String? date,
  }) {
    return IssuedBook(
      name: name ?? this.name,
      subject: subject ?? this.subject,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'subject': subject,
      'date': date,
    };
  }

  factory IssuedBook.fromMap(Map<String, dynamic> map) {
    return IssuedBook(
      name: map['name'] as String,
      subject: map['subject'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IssuedBook.fromJson(String source) =>
      IssuedBook.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'IssuedBook(name: $name, subject: $subject, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IssuedBook &&
        other.name == name &&
        other.subject == subject &&
        other.date == date;
  }

  @override
  int get hashCode => name.hashCode ^ subject.hashCode ^ date.hashCode;
}
