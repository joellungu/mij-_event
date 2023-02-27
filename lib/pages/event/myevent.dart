import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'details.dart';

class MyEvent extends StatelessWidget {
  //
  late RxList liste = [].obs;
  MyEvent() {
    //
    var box = GetStorage();
    //
    liste.value = box.read("liste_event") ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        children: List.generate(
          liste.length,
          (index) {
            print(liste[index]);
            var e = liste[index];
            return ListTile(
              onTap: () {
                //
                Get.to(DetailsEvent(e));
              },
              leading: const Icon(Icons.event),
              title: Text(
                "${e["nom"]}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("${e["datedebut"]}\n${e["heuredebut"]}"),
              trailing: const Icon(
                Icons.edit,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
