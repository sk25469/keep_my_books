import 'package:flutter/material.dart';
import 'package:library_sys/model/book.dart';

class BookListTile extends StatelessWidget {
  final Book book;
  const BookListTile({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: const Icon(Icons.book_sharp),
        title: Text(book.name),
        subtitle: Text(book.author),
        trailing: Text(book.numAvailable.toString()),
      ),
    );
  }
}
