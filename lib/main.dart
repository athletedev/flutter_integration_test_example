import 'package:flutter/material.dart';
import 'package:integration_test_example/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              key: const ValueKey('username_field_key'),
              controller: userNameController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: error,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              key: const ValueKey('password_field_key'),
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: error,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              key: const ValueKey('login_button_key'),
              onPressed: () {
                if (userNameController.text == 'admin' && passwordController.text == 'admin1234') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else {
                  setState(() {
                    error = 'Invalid username or password';
                  });
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
