import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mijevent/utils/requete.dart';

class ProfilInviteController extends GetxController with StateMixin<String> {
  //
  Requete requete = Requete();
  //
  check(Map e) async {
    change("", status: RxStatus.loading());
    //
    Response rep = await requete.postE("check", e);
    if (rep.isOk) {
      //
      print("rep.body: ${rep.body.runtimeType}");
      //
      Map r = rep.body;
      //
      //Get.back();
      // Get.dialog(
      //   Center(
      //     child: Html(
      //       data: r["message"],
      //     ),
      //   ),
      // );
      //

      change(r["message"], status: RxStatus.success());
    } else {
      //
      var r = rep.body;
      //
      print("La valeur vaut id: $r");
      print("La valeur vaut id: ${rep.statusCode}");
      //Get.back();
      change(
          "erreur dans le serveur veuilliez reessayer\n${rep.statusCode}\n$r",
          status: RxStatus.success());
      // Get.dialog(
      //   Center(
      //     child: Html(
      //       data: r["message"],
      //     ),
      //   ),
      // );
      //
    }
  }
}
