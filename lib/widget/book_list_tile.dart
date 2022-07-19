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
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: FittedBox(
                  child: Text(
                    book.numAvailable.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'Available',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
