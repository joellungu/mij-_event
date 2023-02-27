import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailsEvent();
  }
}

class _DetailsEvent extends State<DetailsEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: Colors.blue,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Un simple evenement pour les boss",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "29 Octobre 2023",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "29",
                                  style: TextStyle(
                                    color: Colors.yellow.shade700,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Oct.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              centerTitle: false,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              height: Get.size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style: styleTitre(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      """Nisi deserunt culpa ullamco anim consectetur elit irure cupidatat ipsum eu qui aliqua. Amet id sit commodo fugiat qui. Magna commodo dolor tempor adipisicing id irure velit irure cupidatat mollit cillum do culpa. Dolor culpa laborum eu sint proident consectetur do et do laboris cillum mollit incididunt velit.""",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.black,
                          builder: (c) {
                            return Container(
                              height: Get.size.height / 1.05,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 10,
                                    child: Container(
                                      height: 7,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: ListView(
                                      padding: EdgeInsets.all(10),
                                      children: [
                                        Text(
                                          """Laboris ea deserunt cupidatat sit. In proident do in voluptate ea cupidatat. Ullamco occaecat sunt id sit fugiat nisi laborum aute id nulla velit.

Esse velit aute excepteur in cillum cillum consectetur sunt. Ex pariatur magna aliquip ipsum aliqua dolor enim ut laboris ut aliqua et aliquip. Excepteur cupidatat esse velit ad. Veniam deserunt labore eiusmod consectetur veniam laboris dolor. Aliquip qui eiusmod ex tempor labore qui quis. Nulla elit incididunt laboris qui commodo qui aliquip nulla. Ullamco est occaecat officia aute deserunt proident eu tempor ex reprehenderit aute non sit.

Eiusmod in consequat culpa consectetur culpa consectetur laboris. Voluptate proident eu ullamco adipisicing ullamco ipsum. Sint irure incididunt consectetur culpa aliquip sunt nisi consectetur consequat nisi sit aute. Occaecat enim ad quis ea veniam ipsum. Deserunt consectetur adipisicing incididunt do sit.

Aliquip sint duis cillum exercitation dolor elit dolor enim eiusmod nulla reprehenderit id. Qui ea et Lorem quis. Eu id anim exercitation ipsum. Occaecat minim magna quis reprehenderit. Adipisicing ad tempor nisi irure reprehenderit cupidatat. Ullamco elit consequat enim ex eu laborum do incididunt.

Proident aliquip ea nulla aliqua aliquip esse ut sint cupidatat ipsum eu. Enim Lorem cupidatat Lorem aliqua commodo nostrud occaecat ea nostrud. Magna deserunt voluptate ad sunt irure qui irure fugiat sunt. Id mollit consequat proident velit. Quis sunt eu nisi nulla aute voluptate quis non aute consectetur consequat non.

Labore labore do mollit exercitation ex eiusmod sit ullamco in laborum. Mollit do pariatur ut aute ea elit consectetur veniam nulla ullamco incididunt. Tempor dolore amet sunt est veniam id excepteur cillum. Nostrud commodo do laborum magna consequat deserunt eu minim sint sint ipsum pariatur do.""",
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade200,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              height: Get.size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Membres",
                      style: styleTitre(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(5, (index) {
                      if (index == 4) {
                        return InkWell(
                          onTap: () {
                            //
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.black,
                              builder: (c) {
                                return Container(
                                  height: Get.size.height / 1.05,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade800,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 10,
                                        child: Container(
                                          height: 7,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: GridView.count(
                                          padding: EdgeInsets.all(10),
                                          mainAxisSpacing: 2,
                                          crossAxisSpacing: 2,
                                          crossAxisCount: 7,
                                          children: List.generate(
                                            12,
                                            (index) {
                                              return Container(
                                                height: 50,
                                                width: 50,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.yellow.shade700,
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade700,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Text(
                              "12",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade700,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        );
                      }
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      TextSpan(
                        text: "16 ",
                        children: [
                          TextSpan(
                            text:
                                "People have already signed up for the event, hurry\n",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          TextSpan(
                            text: "book your spot now",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: Get.size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Avenue et temps",
                      style: styleTitre(),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.timelapse,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  "29 Mars 2002 Friday 1- 2pm",
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.location_on,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  "Tamra, Shangri La Raijpath, New Delhi 100011",
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "ACCEPTER L'INVITATION",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                color: Colors.greenAccent,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "REFUSER L'INVITATION",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                color: Colors.red.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle styleTitre() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.yellow.shade700,
    );
  }
}
