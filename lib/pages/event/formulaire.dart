import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';

enum typeE {
  MARIAGE,
  ANNIVERSAIRE,
  CONFERENCE,
  CONCERT,
  SEMINAITRE,
  LOISIR,
  REUNION,
  BAL,
  CELEBRATION,
  FUNERAILLE,
  AUTRE
}

class Formulaire extends StatefulWidget {
  //
  State state;
  //
  Formulaire(this.state);
  //
  @override
  State<StatefulWidget> createState() {
    return _Formulaire();
  }
}

class _Formulaire extends State<Formulaire> {
  //
  Map<dynamic, dynamic> user = {};
  //

  //var agentController = Get.find();
  //
  Rx type = typeE.ANNIVERSAIRE.obs;
  //
  final formKey = GlobalKey<FormState>();
  final nom = TextEditingController();
  final province = TextEditingController();
  final ville = TextEditingController();
  final adresse = TextEditingController();
  final reference = TextEditingController();
  final preciser = TextEditingController();
  final nb_place = TextEditingController();
  final nb_table = TextEditingController();
  //
  Rx datedebut = "".obs;
  Rx datefin = "".obs;
  Rx heuredebut = "".obs;
  Rx heurefin = "".obs;
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
  RxString hdebut = "1 H".obs;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulaire evenement"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nom,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Veuilliez inserer le nom";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), hintText: "Nom"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: province,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Veuilliez inserer la province";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.map_rounded), hintText: "Province"),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: ville,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Veuilliez inserer la ville, cité ou la communune";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.business), hintText: "Ville / Commune"),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: adresse,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_on),
                    hintText: "Adresse",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: reference,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Veuilliez inserer la référence";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.location_searching),
                      hintText: "Référence"),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDatePickerMode: DatePickerMode.day,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1990),
                                    lastDate: DateTime(2030),
                                  ).then((value) {
                                    var v = value as DateTime;
                                    datedebut.value =
                                        "${v.day}/${v.month}/${v.year}";
                                  });
                                },
                                icon: Icon(Icons.date_range),
                              ),
                              const Text("Date de début"),
                              Obx(() => Text("$datedebut"))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDatePickerMode: DatePickerMode.day,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1990),
                                    lastDate: DateTime(2030),
                                  ).then((value) {
                                    var v = value as DateTime;
                                    datefin.value =
                                        "${v.day}/${v.month}/${v.year}";
                                  });
                                  ;
                                },
                                icon: const Icon(Icons.date_range),
                              ),
                              const Text("Date de fin"),
                              Obx(() => Text("$datefin"))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  //
                                  showDialog(
                                      context: context,
                                      builder: (c) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 50,
                                                color: Colors.transparent,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: TimePickerDialog(
                                                  initialTime: TimeOfDay.now(),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }).then((value) {
                                    print("l heure: $value");
                                    var v = value as TimeOfDay;
                                    heuredebut.value = '${v.hour}:${v.minute}';
                                  });
                                },
                                icon: Icon(
                                  Icons.access_time,
                                ),
                              ),
                              Text(
                                "Heure debut",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  heuredebut.value,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  //
                                  showDialog(
                                      context: context,
                                      builder: (c) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 50,
                                                color: Colors.transparent,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: TimePickerDialog(
                                                  initialTime: TimeOfDay.now(),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }).then((value) {
                                    var v = value as TimeOfDay;
                                    heurefin.value = '${v.hour}:${v.minute} ';
                                  });
                                },
                                icon: Icon(
                                  Icons.access_time,
                                ),
                              ),
                              Text(
                                "Heure fin",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Obx(() => Text("$heurefin"))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                StatefulBuilder(builder: (context, t) {
                  return Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Type d'événement",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RadioListTile(
                          value: typeE.MARIAGE,
                          title: Text("MARIAGE".capitalize!),
                          groupValue: type.value,
                          onChanged: (s) {
                            type.value = s;
                          },
                        ),
                        RadioListTile(
                          value: typeE.ANNIVERSAIRE,
                          title: Text("ANNIVERSAIRE".capitalize!),
                          groupValue: type.value,
                          onChanged: (s) {
                            type.value = s;
                          },
                        ),
                        RadioListTile(
                          value: typeE.CONCERT,
                          title: Text("CONCERT".capitalize!),
                          groupValue: type.value,
                          onChanged: (s) {
                            type.value = s;
                          },
                        ),
                        RadioListTile(
                          value: typeE.CONFERENCE,
                          title: Text("CONFERENCE".capitalize!),
                          groupValue: type.value,
                          onChanged: (s) {
                            type.value = s;
                          },
                        ),
                        RadioListTile(
                          value: typeE.SEMINAITRE,
                          title: Text("SEMINAITRE".capitalize!),
                          groupValue: type.value,
                          onChanged: (s) {
                            type.value = s;
                          },
                        ),
                        RadioListTile(
                          value: typeE.REUNION,
                          title: Text("REUNION".capitalize!),
                          groupValue: type.value,
                          onChanged: (s) {
                            type.value = s;
                          },
                        ),
                        RadioListTile(
                          value: typeE.LOISIR,
                          title: Text("LOISIR".capitalize!),
                          groupValue: type.value,
                          onChanged: (s) {
                            type.value = s;
                          },
                        ),
                        RadioListTile(
                          value: typeE.CELEBRATION,
                          title: Text("CELEBRATION".capitalize!),
                          groupValue: type.value,
                          onChanged: (s) {
                            type.value = s;
                          },
                        ),
                        RadioListTile(
                          value: typeE.BAL,
                          title: Text("BAL".capitalize!),
                          groupValue: type.value,
                          onChanged: (s) {
                            type.value = s;
                          },
                        ),
                        RadioListTile(
                          value: typeE.FUNERAILLE,
                          title: Text("FUNERAILLE".capitalize!),
                          groupValue: type.value,
                          onChanged: (s) {
                            type.value = s;
                          },
                        ),
                        RadioListTile(
                          value: typeE.AUTRE,
                          title: Text("AUTRE".capitalize!),
                          groupValue: type.value,
                          onChanged: (s) {
                            type.value = s;
                          },
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: preciser,
                  decoration: InputDecoration(
                      icon: Icon(CupertinoIcons.tag), hintText: "Préciser"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: nb_place,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(CupertinoIcons.number),
                      hintText: "Nombre place"),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: nb_table,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(CupertinoIcons.number),
                      hintText: "Nombre de table"),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //
                      print("Cool");
                      //
                      var uuid = Uuid();
                      //
                      Map<String, dynamic> e = {
                        "id": uuid.v1(),
                        "nom": nom.text,
                        "province": province.text,
                        "ville": ville.text,
                        "adresse": adresse.text,
                        "reference": reference.text,
                        "preciser": preciser.text,
                        "nb_place": nb_place.text,
                        "nb_table": nb_table.text,
                        "datedebut": "$datedebut",
                        "datefin": "$datefin",
                        "heuredebut": "$heuredebut",
                        "heurefin": "$heurefin"
                      };
                      Get.dialog(Container(
                        height: 40,
                        width: 40,
                        child: const CircularProgressIndicator(),
                        alignment: Alignment.center,
                      ));
                      //
                      var box = GetStorage();
                      //
                      Timer(Duration(seconds: 2), () {
                        var liste = box.read("liste_event") ?? [];
                        liste.add(e);
                        box.write("liste_event", liste);
                        //
                        Get.back();
                        Get.back();
                      });
                      //agentController.miseAjour(a);
                      //agentController.listage();
                    }
                  },
                  child: const Text("Créer événement"),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getId() async {
    return "";
  }
}
