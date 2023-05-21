import 'package:flutter/material.dart';
import 'package:frontend/globals.dart';
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
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/logo.png"),
          ),
          SizedBox(height: 0.025 * getHeight(context)),
          Text(
            "Welcome to TrimTime",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Text(
            "Your Style, Your Time, Your Way",
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 0.1 * getHeight(context)),
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
