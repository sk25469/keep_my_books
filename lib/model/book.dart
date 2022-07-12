// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Book {
  final String name;
  final String author;
  final int numAvailable;
  final String location;
  final String subjectName;
  Book({
    required this.name,
    required this.author,
    required this.numAvailable,
    required this.location,
    required this.subjectName,
  });

  Book copyWith({
    String? name,
    String? author,
    int? numAvailable,
    String? location,
    String? subjectName,
  }) {
    return Book(
      name: name ?? this.name,
      author: author ?? this.author,
      numAvailable: numAvailable ?? this.numAvailable,
      location: location ?? this.location,
      subjectName: subjectName ?? this.subjectName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'author': author,
      'numAvailable': numAvailable,
      'location': location,
      'subjectName': subjectName,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      name: map['name'] as String,
      author: map['author'] as String,
      numAvailable: map['numAvailable'] as int,
      location: map['location'] as String,
      subjectName: map['subjectName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(name: $name, author: $author, numAvailable: $numAvailable, location: $location, subjectName: $subjectName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Book &&
        other.name == name &&
        other.author == author &&
        other.numAvailable == numAvailable &&
        other.location == location &&
        other.subjectName == subjectName;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        author.hashCode ^
        numAvailable.hashCode ^
        location.hashCode ^
        subjectName.hashCode;
  }
}
