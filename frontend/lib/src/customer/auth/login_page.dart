import 'package:flutter/material.dart';
import 'package:frontend/routes.dart';

class CustomerLoginPage extends StatefulWidget {
  const CustomerLoginPage({super.key});

  @override
  State<CustomerLoginPage> createState() => _CustomerLoginPageState();
}

class _CustomerLoginPageState extends State<CustomerLoginPage> {
  String email = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const Spacer(),
            TextField(
              decoration: const InputDecoration(
                hintText: "Email",
              ),
              onChanged: (e) => email = e.trim(),
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Password",
              ),
              onChanged: (e) => password = e.trim(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.customerHomeRoute, (route) => false);
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(Routes.customerSignUpRoute);
              },
              child: const Text("Don't have an account? Sign Up"),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
