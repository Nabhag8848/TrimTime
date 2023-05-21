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
        title: const Text("Barber Sign Up"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Basic Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (e) => userName = e.trim(),
              decoration: const InputDecoration(
                hintText: "Your Name",
              ),
            ),
            TextField(
              onChanged: (e) => email = e.trim(),
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            TextField(
              onChanged: (e) => email = e.trim(),
              decoration: const InputDecoration(
                hintText: "Phone",
              ),
            ),
            TextField(
              onChanged: (e) => password = e.trim(),
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Shop Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (e) => shopName = e.trim(),
              decoration: const InputDecoration(
                hintText: "Shop Name",
              ),
            ),
            TextField(
              onChanged: (e) => shopName = e.trim(),
              decoration: const InputDecoration(
                hintText: "Shop Address",
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
            const SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.barberHomeRoute,
                    (route) => false,
                  );
                },
                child: const Text("Sign Up"),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.barberLoginRoute);
                },
                child: const Text("Don't have an account? Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
