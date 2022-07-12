import 'package:flutter/material.dart';
import 'package:library_sys/model/book.dart';
import 'package:library_sys/model/issued_book.dart';
import 'package:library_sys/service/database_service.dart';
import 'package:library_sys/widget/gradient_button.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;
  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  bool isLoading = false;
  bool isIssued = false;

  void checkIfIssued() async {
    isLoading = true;
    isIssued = await DbManager().hasAlreadyIssued(widget.book).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIfIssued();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.book.name,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.greenAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.book.name,
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.book.author,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              widget.book.subjectName,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              color: Colors.brown,
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  widget.book.numAvailable.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Available',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              color: Colors.blueAccent,
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  widget.book.location,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Available',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GradientButton(
                  isIssued: isIssued,
                  text: isIssued ? 'Issued' : 'Issue',
                  onPressed: isIssued
                      ? () {
                          return null;
                        }
                      : () async {
                          final today = DateTime.now();
                          await DbManager()
                              .insertIssuedBook(
                            IssuedBook(
                                name: widget.book.name,
                                subject: widget.book.subjectName,
                                date: '${today.day}/${today.month}/${today.year}'),
                          )
                              .whenComplete(() {
                            setState(() {
                              isIssued = true;
                            });
                            const snackBar = SnackBar(
                              content: Text('Book Issued'),
                              // action: SnackBarAction(
                              //   label: 'Book Issued',
                              //   onPressed: () {
                              //     // Some code to undo the change.
                              //   },
                              // ),
                              duration: Duration(seconds: 1),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          });
                        },
                ),
              ],
            ),
    );
  }
}