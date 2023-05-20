import 'package:flutter/material.dart';
import 'package:frontend/routes.dart';

class BarberLoginPage extends StatefulWidget {
  const BarberLoginPage({super.key});

  @override
  State<BarberLoginPage> createState() => _BarberLoginPageState();
}

class _BarberLoginPageState extends State<BarberLoginPage> {
  String email = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Barber Login"),
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
                // if (mounted) {
                //   Navigator.pushReplacementNamed(context, Routes.homeRoute);
                // }
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(Routes.barberSignUpRoute);
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
