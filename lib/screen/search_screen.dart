import 'package:flutter/material.dart';
import 'package:library_sys/screen/search_results_screen.dart';
import 'package:library_sys/widget/gradient_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String branchName = 'CSE';
  final searchController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Select Branch',
                            style: TextStyle(fontSize: 20),
                          ),
                          DropdownButton<String>(
                            value: branchName,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 3,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                branchName = newValue!;
                              });
                            },
                            items: <String>[
                              'CSE',
                              'ECE',
                              'EE',
                              'EI',
                              'ME',
                              'CE',
                              'Others'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Card(
                        elevation: 4,
                        child: SizedBox(
                          width: 220,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8,
                            ),
                            child: TextFormField(
                              controller: searchController,
                              autocorrect: false,
                              enableSuggestions: true,
                              keyboardType: TextInputType.name,
                              onSaved: (value) {},
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: const TextStyle(color: Colors.black54),
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.blue.shade700,
                                  size: 24,
                                ),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Name not given';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GradientButton(
                    text: 'Search',
                    isIssued: false,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 1)).whenComplete(() {
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchResultScreen(
                              searchText: searchController.text,
                              branchName: branchName,
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
