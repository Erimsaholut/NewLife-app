import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chain.dart';





Future<void> setAlertButton(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirmation"),
        content: const Text("Are you sure you want to break the chain?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(); // Close the dialog
              String year = await getYear();
              if (year != "null") {
                await breakChain();
              }
            },
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );
}
