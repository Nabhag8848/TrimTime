import 'package:flutter/material.dart';
import 'package:frontend/routes.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: const Text("Login as Barber"),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.barberLoginRoute);
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text("Login as Customer"),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.customerLoginRoute);
              },
            ),
          )
        ],
      ),
    );
  }
}
