import 'dart:async';
import 'package:barjo/pages/event/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum typeE {
  INVITE,
  PROTOCOLE,
  INTERVENANT,
  ADMINISTRATEUR,
  SUPERVISEUR,
}

class MesContacts extends StatefulWidget {
  State state;
  MesContacts(this.state);
  @override
  State<StatefulWidget> createState() {
    return _MesContacts();
  }
}

class _MesContacts extends State<MesContacts> {
  //
  Rx type = typeE.ADMINISTRATEUR.obs;
  //
  String ty = "";
  //
  TextEditingController nomC = TextEditingController();
  TextEditingController numC = TextEditingController();
  //
  EventController eventController = Get.find();
  //
  @override
  void dispose() {
    Timer(const Duration(seconds: 1), () {
      widget.state.setState(() {});
    });
    //
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40,
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      //
                      Get.back();
                      //
                    },
                  ),
                  const Text(
                    "Role",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container()
                ],
              ),
            ),
            TextField(
              controller: nomC,
              decoration: InputDecoration(
                hintText: "Nom",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: numC,
              decoration: InputDecoration(
                hintText: "Téléphone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Obx(
                () => ListView(
                  children: List.generate(
                    typeE.values.length,
                    (index) => RadioListTile<typeE>(
                      value: typeE.values[index],
                      title: Text("${typeE.values[index].name}".capitalize!),
                      groupValue: type.value,
                      onChanged: (typeE? s) {
                        typeE vv = s!;
                        //print(v.runtimeType);
                        print(vv.name);
                        //
                        type.value = s;
                        //
                        ty = vv.name;
                        //
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  //
                  // eventController.listeParticipants
                  // .add({
                  //   "nom": c.displayName,
                  //   "famille": c.name,
                  //   "numero": c.phones.first.number,
                  //   "table": "",
                  //   "role": ty,
                  // });
                  //
                  var box = GetStorage();
                  //
                  List listeParticipant = box.read("liste_participant") ?? [];
                  //
                  listeParticipant.add({
                    "nom": nomC.text,
                    "numero": numC.text,
                    //"table": "",
                    "role": ty,
                  });
                  //
                  eventController.listeParticipants.value = listeParticipant;
                  //
                  box.write("liste_participant", listeParticipant);
                  //
                  Get.back();
                },
                child: const Text("Valider"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
