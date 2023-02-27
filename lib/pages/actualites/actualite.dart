import 'package:barjo/pages/profil/profil.dart';
import 'package:barjo/widgets/carte_produit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Actualite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Actualite();
  }
}

class _Actualite extends State<Actualite> with SingleTickerProviderStateMixin {
  TabController? controller;
  //
  List options = [
    "Events",
    "INServices",
  ];
  //
  //
  RxList<bool> choix = [true, false].obs;
  //
  RxInt vue = 0.obs;
  //
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(1),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                onStretchTrigger: () {
                  //print("Le truc strck");
                  return Future.value();
                },
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: Get.size.height / 4.5,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 2,
                  background: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.to(Profil());
                                    },
                                    icon: const Icon(CupertinoIcons.person),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Recherche des Evenements",
                                      filled: true, //<-- SEE HERE
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 0,
                                        horizontal: 10,
                                      ),
                                      fillColor: Colors.grey.shade500,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              //color: Colors.grey,
                              alignment: Alignment.centerLeft,
                              // ignore: sort_child_properties_last
                              child: TabBar(
                                controller: controller,
                                isScrollable: true,
                                labelColor: Colors.white,
                                indicatorColor: Colors.yellow.shade900,
                                indicatorSize: TabBarIndicatorSize.label,
                                tabs: [
                                  const Tab(
                                    text: "Events",
                                  ),
                                  const Tab(
                                    text: "Services",
                                  ),
                                ],
                              ),

                              height: 70,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  centerTitle: false,
                ),
              ),
              SliverToBoxAdapter(
                child: CarteProduit("Mes Invitations"),
              ),
              SliverToBoxAdapter(
                child: CarteProduit("Fil d'actualité"),
              ),
              SliverToBoxAdapter(
                child: CarteProduit("Conférences"),
              ),
              SliverToBoxAdapter(
                child: CarteProduit("Concerts"),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //Get.to(Formulaire(this));
            },
            backgroundColor: Colors.yellow.shade900,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
