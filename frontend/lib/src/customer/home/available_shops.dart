import 'package:flutter/material.dart';
import 'package:frontend/data.dart';
import 'package:frontend/routes.dart';

class AvailableShopsPage extends StatefulWidget {
  final String time;
  const AvailableShopsPage({super.key, required this.time});

  @override
  State<AvailableShopsPage> createState() => _AvailableShopsPageState();
}

class _AvailableShopsPageState extends State<AvailableShopsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Shops ${widget.time}"),
        // centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Confirm Selection"),
                    content: Text(
                      "Are you sure you want to book Siddharth's saloon for ${widget.time}.",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            Routes.customerHomeRoute,
                            (route) => false,
                          );
                        },
                        child: const Text("Confirm"),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Cancel"),
                      ),
                    ],
                  );
                  // return const Dialog(
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Text("Confirm Selection"),
                  //     ],
                  //   ),
                  // );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(images[index]),
                ),
                title: Text("${usernames[index]}'s saloon"),
                subtitle: Text(names[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
