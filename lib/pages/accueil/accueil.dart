import 'package:mijevent/pages/actualites/actualite.dart';
import 'package:mijevent/pages/event/event.dart';
import 'package:mijevent/pages/profil/profil.dart';
import 'package:mijevent/pages/scanner/scan.dart';
import 'package:mijevent/pages/scanner/scanner.dart';
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
      // appBar: AppBar(
      //   title: const Text("MJI Event"),
      // ),

      body: Obx(() {
        if (index.value == 0) {
          return Container();
        } else if (index.value == 1) {
          return Evenement();
        } else if (index.value == 2) {
          return QRViewExample();
        } else {
          return Container();
        }
      }),
      //_____________________________
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
