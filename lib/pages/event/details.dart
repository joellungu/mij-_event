import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:barjo/pages/event/allcontacts.dart';
import 'package:barjo/pages/event/event_controller.dart';
import 'package:barjo/pages/event/mescontactes.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
//import 'package:qr_flutter/qr_flutter.dart';
//import 'package:widget_to_image/widget_to_image.dart';

//
RxList listeTable = [
  {"nom": "TOUS", "numero": -1}
].obs;

//
//
class DetailsEvent extends StatefulWidget {
  Map e;
  DetailsEvent(this.e);
  @override
  State<StatefulWidget> createState() {
    return _DetailsEvent();
  }
}

class _DetailsEvent extends State<DetailsEvent> {
  //
  RxList<bool> choix = [true, false, false].obs;
  //
  RxInt vue = 0.obs;
  String op = "TOUS";
  String tb = "";
  //
  List options = [
    "TOUS",
    "INVITE",
    "PROTOCOLE",
    "INTERVENANT",
    "ADMINISTRATEUR",
    "SUPERVISEUR"
  ];
  //
  final nom = TextEditingController();
  final province = TextEditingController();
  final ville = TextEditingController();
  final adresse = TextEditingController();
  final reference = TextEditingController();
  final preciser = TextEditingController();
  final nb_place = TextEditingController();
  final nb_table = TextEditingController();
  //
  //
  EventController eventController = Get.find();
  //
  @override
  void initState() {
    //
    var box = GetStorage();
    List listeParticipant = box.read("liste_participant") ?? [];
    //
    print("Initialisation: $listeParticipant");
    //
    eventController.listeParticipants.value = listeParticipant;
    //
    print("Initialisations: ${eventController.listeParticipants.value}");
    //
    super.initState();
  }

  //
  //
  @override
  Widget build(BuildContext context) {
    //
    //var box = GetStorage();
    //List listeParticipant = box.read("liste_participant") ?? [];
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails"),
        actions: [
          PopupMenuButton<String>(
            child: const Icon(
              Icons.filter,
              color: Colors.white,
            ),
            itemBuilder: (c) {
              return List.generate(
                listeTable.length,
                (index) => PopupMenuItem<String>(
                  onTap: () {
                    setState(() {
                      tb = listeTable[index]["nom"];
                      print("Table: $tb");
                      print(listeTable[index]);
                      print(listeTable[index].runtimeType);
                    });
                  },
                  value: listeTable[index]["nom"],
                  child: Text("${listeTable[index]["nom"]}"),
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          PopupMenuButton<String>(
            child: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (c) {
              return List.generate(
                options.length,
                (index) => PopupMenuItem<String>(
                  onTap: () {
                    setState(() {
                      op = options[index];
                      print(options[index]);
                      print(options[index].runtimeType);
                    });
                  },
                  value: options[index],
                  child: Text("${options[index]}"),
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
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
                children: const [
                  Text("  Détails  "),
                  Text("  Participants  "),
                  Text("  Actions  "),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(
              () => Container(
                child: vue.value == 0
                    ? ListView(
                        padding: const EdgeInsets.all(10),
                        children: [
                          ListTile(
                            title: Text("Nom"),
                            subtitle: Text("${widget.e["nom"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                //
                                showDialog(
                                  context: context,
                                  builder: (cc) {
                                    return AlertDialog(
                                      title: const Text("Nom"),
                                      content: TextField(
                                        controller: nom,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                //
                              },
                            ),
                          ),
                          ListTile(
                            title: Text("Province"),
                            subtitle: Text("${widget.e["province"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          ListTile(
                            title: Text("Ville"),
                            subtitle: Text("${widget.e["ville"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          ListTile(
                            title: Text("Adresse"),
                            subtitle: Text("${widget.e["adresse"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          ListTile(
                            title: Text("Reference"),
                            subtitle: Text("${widget.e["reference"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          widget.e["preciser"] != null
                              ? ListTile(
                                  title: Text("Preciser"),
                                  subtitle: Text("${widget.e["preciser"]}"),
                                  trailing: IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {},
                                  ),
                                )
                              : Container(),
                          ListTile(
                            title: Text("Nombre place"),
                            subtitle: Text("${widget.e["nb_place"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          ListTile(
                            title: Text("Nombre table"),
                            subtitle: Text("${widget.e["nb_table"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          ListTile(
                            title: Text("Date debut"),
                            subtitle: Text("${widget.e["datedebut"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          ListTile(
                            title: Text("Date fin"),
                            subtitle: Text("${widget.e["datefin"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          ListTile(
                            title: Text("Heure debut"),
                            subtitle: Text("${widget.e["heuredebut"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          ListTile(
                            title: Text("Heuref in"),
                            subtitle: Text("${widget.e["heurefin"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            height: 140,
                          ),
                        ],
                      )
                    : vue.value == 1
                        ? ListView(
                            children: List.generate(
                              eventController.listeParticipants.length,
                              (index) {
                                Map c =
                                    eventController.listeParticipants[index];
                                //Map e = listeTable[index];
                                print("==============:$tb::${c['table']}");
                                if (c['role'] == op || op == "TOUS") {
                                  if (c['table'] == tb ||
                                      tb == "TOUS" ||
                                      c['table'] == "") {
                                    return ListTile(
                                      onTap: () {
                                        TextEditingController text =
                                            TextEditingController();
                                        /*
                                      PopupMenuButton<String>(
                                        child: const Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                        itemBuilder: (c) {
                                          return List.generate(
                                            listeTable.length,
                                            (index) => PopupMenuItem<String>(
                                              onTap: () {
                                                setState(() {
                                                  tb = listeTable[index];
                                                  print(listeTable[index]);
                                                  print(listeTable[index].runtimeType);
                                                });
                                              },
                                              value: options[index],
                                              child: Text("${options[index]}"),
                                            ),
                                          );
                                        },
                                      ),
                                      */
                                        text.text = c['nom']; //"${c['nom']}"
                                        showDialog(
                                          context: context,
                                          builder: (cc) {
                                            RxString tab = "".obs;
                                            return AlertDialog(
                                              title: const Text("Options"),
                                              content: Container(
                                                height: 100,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    TextField(
                                                      controller: text,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Obx(
                                                          () => Text(
                                                              "Table: $tab"),
                                                        ),
                                                        PopupMenuButton<String>(
                                                          child: const Icon(
                                                            Icons.add_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          itemBuilder: (c) {
                                                            return List
                                                                .generate(
                                                              listeTable.length,
                                                              (index) =>
                                                                  PopupMenuItem<
                                                                      String>(
                                                                onTap: () {
                                                                  setState(() {
                                                                    tab.value =
                                                                        listeTable[index]
                                                                            [
                                                                            "nom"];
                                                                    print(listeTable[
                                                                        index]);
                                                                    print(listeTable[
                                                                            index]
                                                                        .runtimeType);
                                                                  });
                                                                },
                                                                value: listeTable[
                                                                        index]
                                                                    ["nom"],
                                                                child: Text(
                                                                    "${listeTable[index]["nom"]}"),
                                                              ),
                                                            );
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                IconButton(
                                                  onPressed: () {
                                                    if (text.text.isNotEmpty) {
                                                      setState(() {
                                                        eventController
                                                                    .listeParticipants[
                                                                index]["nom"] =
                                                            text.text;
                                                        //
                                                        eventController
                                                                    .listeParticipants[
                                                                index]["table"] =
                                                            tab.value;
                                                        //
                                                        print(
                                                            "Erreur: ${eventController.listeParticipants}");
                                                        Get.back();
                                                      });
                                                    }
                                                  },
                                                  icon: const Icon(
                                                    Icons.check,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    //

                                                    eventController
                                                        .listeParticipants
                                                        .removeAt(index);
                                                    //
                                                    var box = GetStorage();
                                                    box.write(
                                                        "liste_participant",
                                                        eventController
                                                            .listeParticipants);
                                                    //
                                                    Get.back();
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        //
                                      },
                                      leading: const Icon(Icons.person),
                                      title: Text(
                                        "${c['nom']}",
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                            text: "${c['numero']}\n",
                                            style: const TextStyle(
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                text: "table: ${c['table']}",
                                                style: TextStyle(
                                                    color:
                                                        Colors.green.shade700),
                                              )
                                            ],
                                          )),
                                        ],
                                      ),
                                      trailing: Text("${c['role']}"),
                                    );
                                  } else {
                                    return Container();
                                  }
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Container(
                                  width: 250,
                                  alignment: Alignment.center,
                                  child: const Text(
                                      "Créer des PDF pour chaque invité"),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Container(
                                  width: 250,
                                  alignment: Alignment.center,
                                  child: const Text(
                                      "Envoyer les invitations via les numéro"),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(TableManager());
                                },
                                child: Container(
                                  width: 250,
                                  alignment: Alignment.center,
                                  child: const Text("Tables"),
                                ),
                              ),
                            ],
                          ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Obx(
        () => vue.value == 0
            ? FloatingActionButton(
                key: UniqueKey(),
                tooltip: "supprimer",
                heroTag: "supprimer",
                backgroundColor: Colors.white,
                onPressed: () {
                  //
                  showDialog(
                    context: context,
                    builder: (cc) {
                      return AlertDialog(
                        title: const Text("Supprimer"),
                        content: const Text(
                            "Voulez-vous vraiment supprimer cet'événement"),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              )
            : vue.value == 1
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        heroTag: "pdf",
                        onPressed: () async {
                          //
                          // Get.dialog(Container(
                          //   height: 40,
                          //   width: 40,
                          //   child: const CircularProgressIndicator(),
                          //   alignment: Alignment.center,
                          // ));

                          //
                          late List<FileSystemEntity> _folders;
                          /*
                          Future<void> getDir() async {
                            final directory =
                                await getExternalStorageDirectories(
                                    type: StorageDirectory.pictures);
                            final dir = directory;
                            String pdfDirectory = '$dir/';
                            final myDir = Directory(pdfDirectory);
                            // setState(() {
                            //   _folders = myDir.listSync(
                            //       recursive: true, followLinks: false);
                            // });
                            print(myDir.path);
                          }
                          */
                          //

                          // storage permission ask
                          var status = await Permission.storage.status;
                          if (!status.isGranted) {
                            await Permission.storage.request();
                            //
                          }
                          showDialog(
                            context: context,
                            builder: (c) {
                              return Material(
                                color: Colors.white,
                                child: LoaderPrinter(),
                              );
                            },
                          );
                          //
                        },
                        child: const Icon(Icons.picture_as_pdf_outlined),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton(
                        heroTag: "ajout",
                        onPressed: () async {
                          //Get contact
                          showDialog(
                            context: context,
                            builder: (c) {
                              return AlertDialog(
                                title: Text("Ajouter"),
                                content: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.5,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  alignment: Alignment.center,
                                  child: MesContacts(this),
                                ),
                              );
                            },
                          );
                          // if (await FlutterContacts.requestPermission()) {
                          //   // Get all contacts (lightly fetched)
                          //   List<Contact> contacts =
                          //       await FlutterContacts.getContacts(
                          //     //withAccounts: true,
                          //     //withPhoto: true,
                          //     withProperties: true,
                          //   );
                          //   //  await FlutterContacts.getContacts();
                          //   print("contacts: $contacts");
                          //   //
                          //   Get.to(MesContacts(contacts, this)); //
                          // }
                        },
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton(
                        heroTag: "ajout contact",
                        onPressed: () async {
                          //Get contact

                          if (await FlutterContacts.requestPermission()) {
                            // Get all contacts (lightly fetched)
                            List<Contact> contacts =
                                await FlutterContacts.getContacts(
                              withAccounts: true,
                              withPhoto: true,
                              withProperties: true,
                            );
                            //  await FlutterContacts.getContacts();
                            print("contacts: $contacts");
                            //
                            Get.to(AllContacts(contacts, this)); //
                          }
                        },
                        child: const Icon(Icons.person_add),
                      )
                    ],
                  )
                : Container(),
      ),
    );
  }

  //
  void mainHandler(dynamic data, SendPort isolateSendPort) {
    if (data == "coupe") {
      Get.back();
    }
  }
  //
}

class TableManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TableManager();
  }
}

class _TableManager extends State<TableManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Table"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Obx(
          () => ListView(
            children: List.generate(listeTable.length, (index) {
              var table = listeTable[index];
              return ListTile(
                leading: const Icon(Icons.tab),
                title: Text("${table["nom"]}"),
                subtitle: Text("${table["numero"]}"),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.shade700,
                  ),
                  onPressed: () {
                    listeTable[index]["nom"] != "TOUS"
                        ? listeTable.removeAt(index)
                        : Get.snackbar("Erreur", "Ne peut-etre supprimée.");
                  },
                ),
              );
            }),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (c) {
                  TextEditingController nomTable = TextEditingController();
                  //
                  TextEditingController numTable = TextEditingController();
                  //

                  return AlertDialog(
                    content: SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("Nouvelle table"),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: nomTable,
                              decoration: const InputDecoration(
                                hintText: "Nom de la table",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: numTable,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "Numéro de table",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (nomTable.text.isNotEmpty &&
                                          numTable.text.isNotEmpty) {
                                        if (!listeTable.contains({
                                          {
                                            "nom": nomTable.text,
                                            "numero": numTable.text
                                          }
                                        })) {
                                          listeTable.add({
                                            "nom": nomTable.text,
                                            "numero": numTable.text
                                          });
                                        } else {
                                          Get.snackbar("Erreur",
                                              "Cette table exist déjà");
                                        }
                                      }
                                      //
                                      Get.back();
                                    },
                                    child: const Text("Ajouter"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.red.shade700,
                                      ),
                                    ),
                                    child: const Text("Annuler"),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 250,
              //height: 50,
              alignment: Alignment.center,
              child: const Text("Ajouter une Table"),
            ),
          ),
        ));
  }
}

class LoaderPrinter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoaderPrinter();
  }
}

class _LoaderPrinter extends State<LoaderPrinter> {
  static test(List o) {
    print("Je suis dans un theadre...");
    int count = 0;
    SendPort sendPort = o[0] as SendPort;
    List listeParticipants = o[1];
    //https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=Example
    load(Map infos) async {
      //
      //var cles = GlobalKey();
      // final qrValidationResult = QrValidator.validate(
      //   data: jsonEncode(infos),
      //   version: QrVersions.auto,
      //   errorCorrectionLevel: QrErrorCorrectLevel.L,
      // );
      //
      // final qrCode = qrValidationResult.qrCode;
      // //
      // final painter = QrPainter.withQr(
      //   qr: qrCode!,
      //   color: const Color(0xFF000000),
      //   gapless: true,
      //   embeddedImageStyle: null,
      //   embeddedImage: null,
      // );
      // //
      // // WidgetsToImageController to access widget
      // // to save image bytes of widget
      // Uint8List? bytes;
      //
      //final data =
      //  await painter.toImageData(2048, format: ui.ImageByteFormat.png);
      //
      //File("/storage/emulated/0/DCIM/INVITATION_${infos["nom"]}.png");

      var url = Uri.parse(
          "https://api.qrserver.com/v1/create-qr-code/?size=500x500&data=${jsonEncode(infos)}");
      var response = await http.get(url);
      var data = response.bodyBytes;
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      var myFile =
          File("/storage/emulated/0/DCIM/INVITATION_${infos["nom"]}.png")
              .writeAsBytes(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      );

      //print("/storage/emulated/0/DCIM/INVITATION_${infos["nom"]}.png");
    }
    //listeParticipants.

    listeParticipants.forEach((element) {
      load(element);
      sendPort.send(1);
    });
    //
    //sendPort.send(1);
  }

  Future<int> isEven() {
    //
    //
    return Future.value(1);
  }

  //
  ReceivePort receivePort = ReceivePort();
  //
  List l = [];
  //
  RxInt nombre = 0.obs;

  @override
  void initState() {
    //
    super.initState();
    //
    EventController eventController = Get.find();
    var box = GetStorage();
    l = box.read("liste_participant");
    print(l);
    print(l.runtimeType);
    Isolate.spawn(test, [receivePort.sendPort, l]);
    //
    receivePort.listen((data) {
      nombre.value += data as int;
      print('Receiving: $data ');
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text("Nombre généré: $nombre/${l.length}"),
        ),
      ),
    );
  }
}
