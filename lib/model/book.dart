// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Book {
  final String name;
  final String author;
  final int numAvailable;
  final String location;
  final String subjectName;
  final String branchName;
  Book({
    required this.name,
    required this.author,
    required this.numAvailable,
    required this.location,
    required this.subjectName,
    required this.branchName,
  });

  Book copyWith({
    String? name,
    String? author,
    int? numAvailable,
    String? location,
    String? subjectName,
    String? branchName,
  }) {
    return Book(
      name: name ?? this.name,
      author: author ?? this.author,
      numAvailable: numAvailable ?? this.numAvailable,
      location: location ?? this.location,
      subjectName: subjectName ?? this.subjectName,
      branchName: branchName ?? this.branchName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'author': author,
      'numAvailable': numAvailable,
      'location': location,
      'subjectName': subjectName,
      'branchName': branchName,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      name: map['name'] as String,
      author: map['author'] as String,
      numAvailable: map['numAvailable'] as int,
      location: map['location'] as String,
      subjectName: map['subjectName'] as String,
      branchName: map['branchName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(name: $name, author: $author, numAvailable: $numAvailable, location: $location, subjectName: $subjectName, branchName: $branchName)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.author == author &&
        other.numAvailable == numAvailable &&
        other.location == location &&
        other.subjectName == subjectName &&
        other.branchName == branchName;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        author.hashCode ^
        numAvailable.hashCode ^
        location.hashCode ^
        subjectName.hashCode ^
        branchName.hashCode;
  }
}
