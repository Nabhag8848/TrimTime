import 'package:flutter/material.dart';

class CustomerSignUpPage extends StatefulWidget {
  const CustomerSignUpPage({super.key});

  @override
  State<CustomerSignUpPage> createState() => _CustomerSignUpPageState();
}

class _CustomerSignUpPageState extends State<CustomerSignUpPage> {
  String email = "", password = "";

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
              onChanged: (e) => email = e,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            TextField(
              onChanged: (e) => password = e,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // if ( mounted) {
                //   Navigator.pushReplacementNamed(context, Routes.homeRoute);
                // }
              },
              child: const Text("Sign up"),
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
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
