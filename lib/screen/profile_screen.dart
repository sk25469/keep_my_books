import 'package:flutter/material.dart';
import 'package:library_sys/model/issued_book.dart';
import 'package:library_sys/service/database_service.dart';
import 'package:library_sys/service/user_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<IssuedBook> issuedBooks = [];
  int numIssuedBooks = 0;
  bool isLoading = false;

  void init() async {
    isLoading = true;
    issuedBooks = await DbManager().getIssuedBook().whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
    numIssuedBooks = issuedBooks.length;
    print(issuedBooks);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  List<TableRow> createTableRow() {
    return List.generate(
      issuedBooks.length,
      (index) => TableRow(
        children: <Widget>[
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(issuedBooks[index].name),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(issuedBooks[index].subject),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(issuedBooks[index].date),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.account_box_rounded,
          color: Colors.black,
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade100,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              // height: 120,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        UserService.name,
                        style: const TextStyle(
                          fontSize: 45,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Scholar ID - ${UserService.scholarID}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueAccent,
                        ),
                        child: Center(
                          child: Text(
                            numIssuedBooks.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: const Text('Books issued'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Books Issued',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : numIssuedBooks == 0
                    ? const Padding(
                        padding: EdgeInsets.only(top: 150.0),
                        child: Center(
                          child: Text(
                            'No books issued',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                          border: TableBorder.all(
                            width: 1,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(100),
                            1: FlexColumnWidth(60),
                            2: FlexColumnWidth(50),
                          },
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            const TableRow(
                              children: <Widget>[
                                TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: SizedBox(
                                    height: 30,
                                    child: Center(child: Text('Book Name')),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: Center(child: Text('Subject')),
                                ),
                                TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: Center(child: Text('Date Issued')),
                                ),
                              ],
                            ),
                            ...createTableRow(),
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
