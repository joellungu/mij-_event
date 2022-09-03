import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Map map = {};

class ProfilInvite extends StatefulWidget {
  Map infos;
  ProfilInvite(this.infos);
  @override
  State<StatefulWidget> createState() {
    return _ProfilInvite();
  }
}

class _ProfilInvite extends State<ProfilInvite> {
  RxBool load = true.obs;
  bool deja = false;

  checking() async {
    //
    var box = GetStorage();
    //
    List listeInvite = box.read("listeInvite") ?? [];
    //
    //
    listeInvite.forEach((element) {
      //
      if (element["nom"] == widget.infos["nom"]) {
        deja = true;
      }
    });
    //
    load.value = false;
    //
  }

  @override
  void initState() {
    print(widget.infos);
    //
    checking();
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil de invité"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Obx(() {
        if (load.value) {
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return ListView(
            padding: const EdgeInsets.only(top: 50),
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  text: "Bienvenue\n\n", //
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                  ),

                  children: [
                    TextSpan(
                      text: "${widget.infos["nom"]}\n\n",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const TextSpan(
                      text: "Vous etes\n\n",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text: "${widget.infos["role"]}\n\n",
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    deja
                        ? const TextSpan(
                            text: "Code déjà enregistré\n\n",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )
                        : const TextSpan(
                            text: "Code non enregistré\n\n",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                    deja
                        ? const TextSpan(text: "")
                        : WidgetSpan(
                            child: ElevatedButton(
                              child: const Text("Valider"),
                              onPressed: () {
                                //
                                var box = GetStorage();
                                List listeInvite =
                                    box.read("listeInvite") ?? [];
                                //
                                map = widget.infos;
                                map['deja'] = true;
                                //map['deja'] = true;
                                listeInvite.add(map);
                                //
                                box.write("listeInvite", listeInvite);
                                //
                                // if (listeInvite.isNotEmpty) {
                                //   listeInvite.forEach((element) {
                                //     //
                                //     if (element["nom"] == widget.infos["nom"]) {
                                //       Map map = element;
                                //       map['deja'] = true;
                                //     } else {}
                                //   });
                                // } else {
                                //   Map map = widget.infos;
                                //   map['deja'] = true;
                                //   listeInvite.add(map);
                                // }
                                //

                                Get.back();
                                //
                                Get.snackbar(
                                    "Action", "Code enregistré avec succès");
                              },
                            ),
                          ),
                  ],
                ),
                textAlign: TextAlign.center,
              )
            ],
          );
        }
      }),
    );
  }
}
