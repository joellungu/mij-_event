import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'profil_invite_controller.dart';

Map map = {};

class ProfilInvite extends GetView<ProfilInviteController> {
  RxBool load = true.obs;
  bool deja = false;
  Map data;

  ProfilInvite(this.data) {
    //
    Map d = {"nom": data['nom']};
    //
    controller.check(d);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil de invité"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: controller.obx((state) {
        String message = state!;
        //
        return Center(
          child: Html(
            data: message,
          ),
        );
      },
          onLoading: Center(
            child: Container(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
          )),
    );
  }
}
