import 'dart:async';
import 'package:barjo/pages/accueil/accueil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'event/event_controller.dart';

class Splash extends StatelessWidget {
  Splash() {
    Timer(const Duration(seconds: 3), () {
      //
      EventController eventController = Get.put(EventController());
      //
      //Formulaire
      Get.off(Accueil());
      //Accueil
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("MJI Event"),
      ),
    );
  }
}
