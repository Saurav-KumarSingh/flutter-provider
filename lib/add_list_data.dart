import 'package:flutter/material.dart';
import 'package:flutter_basic/list_map_provider.dart';
import 'package:provider/provider.dart';

class AddListData extends StatelessWidget {
  const AddListData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Data")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add hardcoded data
            context.read<ListMapProvider>().addData({
              "Name": "Saurav Ka",
              "Mobileno": "7420393839",
            });

            // Show feedback
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Data added successfully")),
            );

            // Optional: go back to the list page after short delay
            Future.delayed(const Duration(milliseconds: 500), () {
              Navigator.pop(context);
            });
          },
          child: const Text("Add Hardcoded Data"),
        ),
      ),
    );
  }
}
