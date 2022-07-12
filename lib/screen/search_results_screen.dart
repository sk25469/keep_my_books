import 'package:flutter/material.dart';
import 'package:library_sys/model/book.dart';
import 'package:library_sys/screen/book_detail_screen.dart';
import 'package:library_sys/service/search_service.dart';
import 'package:library_sys/widget/book_list_tile.dart';

class SearchResultScreen extends StatelessWidget {
  final String branchName, searchText;
  const SearchResultScreen({
    Key? key,
    required this.branchName,
    required this.searchText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Book> searchResult = SearchService(branchName, searchText).getResults();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Result',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: searchResult.isEmpty
          ? const Center(
              child: Text('No results found'),
            )
          : ListView.builder(
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailScreen(
                        book: searchResult[index],
                      ),
                    ),
                  );
                },
                child: BookListTile(
                  book: searchResult[index],
                ),
              ),
              itemCount: searchResult.length,
            ),
    );
  }
}
