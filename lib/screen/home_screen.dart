import 'package:flutter/material.dart';
import 'package:library_sys/demo_data.dart';
import 'package:library_sys/screen/book_detail_screen.dart';
import 'package:library_sys/widget/book_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.book_sharp,
          color: Colors.black,
        ),
        title: const Text(
          'Available Books',
          style: TextStyle(
            color: Colors.black,
            // fontSize: 30,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailScreen(
                  book: demoBooks[index],
                ),
              ),
            );
          },
          child: BookListTile(
            book: demoBooks[index],
          ),
        ),
        itemCount: demoBooks.length,
      ),
    );
  }
}
