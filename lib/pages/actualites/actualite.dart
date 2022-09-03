import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../event/formulaire.dart';

class Actualite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Actualite();
  }
}

class _Actualite extends State<Actualite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(Formulaire(this));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
