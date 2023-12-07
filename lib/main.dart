//import 'package:mijevent/pages/event/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/scanner/profil_invite_controller.dart';
import 'pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //
  //
  ProfilInviteController profilInviteController =
      Get.put(ProfilInviteController());
  //
  await GetStorage.init(); //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MJI Event',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.red,
      ),
      home: Splash(),
    );
  }
}
