import 'dart:async';
import 'package:mijevent/pages/event/event_controller.dart';
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

class AllContacts extends StatefulWidget {
  List listeContacts;
  State state;
  AllContacts(this.listeContacts, this.state);
  @override
  State<StatefulWidget> createState() {
    return _AllContacts();
  }
}

class _AllContacts extends State<AllContacts> {
  //
  Rx type = typeE.ADMINISTRATEUR.obs;
  //
  String ty = "";
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
      appBar: AppBar(
        title: const Text("Mes contacts"),
      ),
      body: ListView(
        children: List.generate(
          widget.listeContacts.length,
          (index) {
            Contact c = widget.listeContacts[index];
            return ListTile(
              onTap: () {
                //
                showDialog(
                  context: context,
                  builder: (cc) {
                    return Material(
                      color: Colors.white,
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
                          Expanded(
                            flex: 1,
                            child: Obx(
                              () => ListView(
                                children: List.generate(
                                  typeE.values.length,
                                  (index) => RadioListTile<typeE>(
                                    value: typeE.values[index],
                                    title: Text("${typeE.values[index].name}"
                                        .capitalize!),
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
                                List listeParticipant =
                                    box.read("liste_participant") ?? [];
                                //
                                listeParticipant.add({
                                  "nom": c.displayName,
                                  "numero": c.phones.first.number,
                                  "role": ty,
                                });
                                //
                                eventController.listeParticipants.value =
                                    listeParticipant;
                                //
                                box.write(
                                    "liste_participant", listeParticipant);
                                //
                                Get.back();
                              },
                              child: const Text("Valider"),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
                //
              },
              //leading: Image.memory(c.avatar!),
              title: Text(
                c.displayName, //${c.familyName} \n ${c.middleName}
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${c.phones.isNotEmpty ? c.phones.first.number : c.phones}",
              ),
            );
          },
        ),
      ),
    );
  }
}

/*
  RadioListTile(
        value: typeE.INTERVENANT,
        title: Text("INTERVENANT".capitalize!),
        groupValue: type.value,
        onChanged: (s) {
          type.value = s;
        },
      ),
      RadioListTile(
        value: typeE.INVITE,
        title: Text("INVITE".capitalize!),
        groupValue: type.value,
        onChanged: (s) {
          type.value = s;
        },
      ),
      RadioListTile(
        value: typeE.PROTOCOLE,
        title: Text("PROTOCOLE".capitalize!),
        groupValue: type.value,
        onChanged: (s) {
          type.value = s;
        },
      ),
      RadioListTile(
        value: typeE.SUPERVISEUR,
        title: Text("SUPERVISEUR".capitalize!),
        groupValue: type.value,
        onChanged: (s) {
          type.value = s;
        },
      ),
                                
*/
