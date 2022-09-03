import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'profil_invite.dart';

class Scanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Scanner();
  }
}

class _Scanner extends State<Scanner> {
  @override
  Widget build(BuildContext context) {
    return MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, args) {
          if (barcode.rawValue == null) {
            Get.snackbar("Erreur", "Impossible de décoder");
          } else {
            final String code = barcode.rawValue!;
            //debugPrint('Barcode found! $code');
            //Get.snackbar("Succès", "Barcode found! $code");
            Get.to(ProfilInvite(jsonDecode(code)));
          }
        });
  }
}
