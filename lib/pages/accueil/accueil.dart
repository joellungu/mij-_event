import 'package:barjo/pages/actualites/actualite.dart';
import 'package:barjo/pages/event/event.dart';
import 'package:barjo/pages/profil/profil.dart';
import 'package:barjo/pages/scanner/profil_invite.dart';
import 'package:barjo/pages/scanner/scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Accueil extends StatelessWidget {
  //
  RxInt index = 0.obs;
  Map mapp = {
    "nom": "Tata Tyti",
    "numero": "17",
    "role": "INVITE",
  };
  //
  Accueil() {
    vue = Container();
  }
  //
  Widget? vue;
  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MJI Event"),
      ),
      body: Obx(() {
        if (index.value == 0) {
          return Actualite();
        } else if (index.value == 1) {
          return Evenement();
        } else if (index.value == 2) {
          return Scanner();
        } else {
          return Profil();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (e) {
            //
            index.value = e;
            //
          },
          //fixedColor: Colors.grey,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.black,
          currentIndex: index.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Accueil",
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.calendar),
                icon: Icon(CupertinoIcons.calendar),
                label: "My Event"),
            BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.qrcode),
                icon: Icon(CupertinoIcons.qrcode),
                label: "Scanner"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
