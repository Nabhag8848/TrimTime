import 'package:flutter/material.dart';
import 'package:frontend/routes.dart';

class BarberSignUpPage extends StatefulWidget {
  const BarberSignUpPage({super.key});

  @override
  State<BarberSignUpPage> createState() => _BarberSignUpPageState();
}

class _BarberSignUpPageState extends State<BarberSignUpPage> {
  String userName = "", shopName = "";
  String email = "", password = "";
  String lat = "", long = "";
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Barber SignUp"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextField(
              onChanged: (e) => userName = e.trim(),
              decoration: const InputDecoration(
                hintText: "Your Name",
              ),
            ),
            TextField(
              onChanged: (e) => shopName = e.trim(),
              decoration: const InputDecoration(
                hintText: "Shop Name",
              ),
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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: lat),
                    decoration: const InputDecoration(
                      hintText: "Latitude",
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: long),
                    decoration: const InputDecoration(
                      hintText: "Longitude",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.mapRoute).then(
                      (data) {
                        if (data == null) return;
                        var value = data as Map;

                        lat = value["lat"].toString();
                        long = value["long"].toString();
                        setState(() {});
                      },
                    );
                  },
                  icon: const Icon(Icons.map),
                ),
              ],
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
          ],
        ),
      ),
    );
  }
}
