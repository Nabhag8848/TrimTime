import 'package:flutter/material.dart';
import 'package:frontend/routes.dart';

class CustomerSignUpPage extends StatefulWidget {
  const CustomerSignUpPage({super.key});

  @override
  State<CustomerSignUpPage> createState() => _CustomerSignUpPageState();
}

class _CustomerSignUpPageState extends State<CustomerSignUpPage> {
  String username = "", email = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SignUp"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const Spacer(),
            TextField(
              decoration: const InputDecoration(
                hintText: "Username",
              ),
              onChanged: (e) => username = e.trim(),
            ),
            TextField(
              onChanged: (e) => email = e.trim(),
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            TextField(
              onChanged: (e) => password = e.trim(),
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.customerHomeRoute, (route) => false);
              },
              child: const Text("Sign up"),
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, Routes.customerLoginRoute);
              },
              child: const Text("Don't have an account? Login"),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
