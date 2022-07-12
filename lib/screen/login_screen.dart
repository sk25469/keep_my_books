import 'package:flutter/material.dart';
import 'package:library_sys/service/user_service.dart';
import 'package:library_sys/widget/bottom_nav.dart';
import 'package:library_sys/widget/gradient_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final idController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Login with student details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                autocorrect: false,
                enableSuggestions: true,
                keyboardType: TextInputType.name,
                onSaved: (value) {},
                decoration: InputDecoration(
                  hintText: 'Your name',
                  hintStyle: const TextStyle(color: Colors.black54),
                  icon: Icon(
                    Icons.account_circle,
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
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: idController,
                autocorrect: false,
                enableSuggestions: true,
                keyboardType: TextInputType.number,
                onSaved: (value) {},
                decoration: InputDecoration(
                  hintText: 'Your Scholar ID',
                  hintStyle: const TextStyle(color: Colors.black54),
                  icon: Icon(
                    Icons.numbers,
                    color: Colors.blue.shade700,
                    size: 24,
                  ),
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Scholar ID not given';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GradientButton(
                      text: 'Login',
                      isIssued: false,
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        UserService(nameController.text, idController.text)
                            .insertUserDetails();
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(
                          const Duration(milliseconds: 800),
                        ).whenComplete(() {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNavigationScreen(),
                            ),
                          );
                        });
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
