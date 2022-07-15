import 'package:library_sys/demo_data.dart';
import 'package:library_sys/utils.dart';
import 'package:library_sys/model/book.dart';

class SearchService {
  String _branchName = '';
  String _searchText = '';

  SearchService(String subjectName, String searchText) {
    _branchName = subjectName;
    _searchText = searchText;
  }

  List<Book> getResults() {
    List<Book> result = [];
    bool wantText = _searchText.isNotEmpty;

    for (var book in demoBooks) {
      if (wantText) {
        if (branchToShortForm[book.branchName] == _branchName &&
            (book.name.contains(_searchText) ||
                book.author.contains(_searchText) ||
                book.subjectName.contains(_searchText))) {
          result.add(book);
        }
      } else {
        if (branchToShortForm[book.branchName] == _branchName) {
          result.add(book);
        }
      }
    }

    return result;
  }
}
