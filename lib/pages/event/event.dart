import 'package:mijevent/pages/event/formulaire.dart';
import 'package:mijevent/pages/event/invitation.dart';
import 'package:mijevent/pages/event/myevent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Evenement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Evenement();
  }
}

class _Evenement extends State<Evenement> {
  //
  RxList<bool> choix = [true, false].obs;
  //
  RxInt vue = 0.obs;
  //
  //CommandeAgentController commandeAgentController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 35,
            alignment: Alignment.center,
            child: Obx(
              () => ToggleButtons(
                children: const [
                  Text("  Mes Evenements  "),
                  Text("  Invitations  "),
                ],
                onPressed: (int index) {
                  for (int btnIndex = 0; btnIndex < choix.length; btnIndex++) {
                    if (btnIndex == index) {
                      choix[btnIndex] = true;
                      vue.value = index;
                    } else {
                      choix[btnIndex] = false;
                    }
                  }
                },
                borderRadius: BorderRadius.circular(10),
                isSelected: choix.value,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(
              () => Container(
                child: vue.value == 0 ? MyEvent() : Invitation(),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Obx(
        () => vue.value == 0
            ? FloatingActionButton(
                onPressed: () {
                  Get.to(Formulaire(this));
                },
                child: const Icon(Icons.add),
              )
            : Container(),
      ),
    );
  }
}
