import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Profil();
  }
}

class _Profil extends State<Profil> {
  //
  final _formKey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final nom = TextEditingController();
  RxBool dejaLog = false.obs;
  late CountryCode countryCode = CountryCode(
      code: "CD", dialCode: "+243", name: "République démocratique du Congo");
  //
  //LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => CheckboxListTile(
                value: dejaLog.value,
                title: const Text("J'ai déjà un compte"),
                subtitle: const Text("J'ai déjà un compte"),
                dense: true,
                onChanged: (e) {
                  dejaLog.value = e!;
                },
              ),
            ),
            Obx(
              () => dejaLog.value
                  ? Container()
                  : TextFormField(
                      controller: nom,
                      decoration: const InputDecoration(
                        hintText: 'Nom complet',
                        labelText: 'Nom complet',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Entrez votre mot de passe';
                        }

                        return null;
                      },
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: CountryCodePicker(
                    onChanged: (p) {
                      countryCode = p;
                      print(p.code);
                      print(p.dialCode);
                      print(p.name);
                      print(p.flagUri);
                    },
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'CD',
                    favorite: ['+243', 'FR'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: TextFormField(
                    controller: phone,
                    decoration: const InputDecoration(
                      hintText: 'Phone',
                      labelText: 'Phone',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrez votre mot de passe';
                      }

                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   /*
                //           Timer(const Duration(seconds: 4), () {
                //             Get.snackbar("Correct", "Un simple message!");
                //           });
                //           */
                //   //Get.off(Accueil());
                //   loginController.code.value = false;
                //   //
                //   Get.dialog(
                //     const Center(
                //       child: SizedBox(
                //         height: 30,
                //         width: 30,
                //         child: CircularProgressIndicator(),
                //       ),
                //     ),
                //     name: "Attente...",
                //   );

                //   //
                //   // if (dejaLog.value) {
                //   //   loginController.log(
                //   //       "${countryCode.code}", phone.text, '', dejaLog.value);
                //   // } else {
                //   //   loginController.log("${countryCode.code}", phone.text,
                //   //       nom.text, dejaLog.value);
                //   // }
                //   //
                //   //splashController.seLoger(true);
                // }
              },
              child: const Text("Valider"),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
