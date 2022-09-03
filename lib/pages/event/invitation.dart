import 'package:flutter/material.dart';

class Invitation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        5,
        (index) => ListTile(
          onTap: () {
            //
          },
          leading: const Icon(Icons.mail_outline),
          title: const Text(
            "Mariage de Papy",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text("12/12/2022"),
        ),
      ),
    );
  }
}
