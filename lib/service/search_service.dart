import 'package:library_sys/demo_data.dart';
import 'package:library_sys/utils.dart';
import 'package:library_sys/model/book.dart';

class SearchService {
  String _subjectName = '';
  String _searchText = '';

  SearchService(String subjectName, String searchText) {
    _subjectName = subjectName;
    _searchText = searchText;
  }

  List<Book> getResults() {
    List<Book> result = [];
    bool wantText = _searchText.isNotEmpty;

    for (var book in demoBooks) {
      if (wantText) {
        if (branchToShortForm[book.subjectName] == _subjectName &&
            book.name.contains(_searchText)) {
          result.add(book);
        }
      } else {
        if (branchToShortForm[book.subjectName] == _subjectName) {
          result.add(book);
        }
      }
    }

    return result;
  }
}
