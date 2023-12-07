import 'package:mijevent/pages/details/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarteProduit extends StatefulWidget {
  String titre;
  CarteProduit(this.titre);
  @override
  State<StatefulWidget> createState() {
    return _CarteProduit();
  }
}

class _CarteProduit extends State<CarteProduit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height / 3.5,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mes evenements",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.grey.shade400,
                  ),
                ),
                Text(
                  "Voir plus",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GridView.count(
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              crossAxisCount: 1,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1,
              children: List.generate(
                10,
                (index) {
                  return InkWell(
                    onTap: () {
                      Get.to(DetailsEvent());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.black,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              padding: const EdgeInsets.all(3),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    flex: 3,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Materclass Event",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.timelapse,
                                                      size: 13,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      " Vend. 13 - 19h",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      size: 13,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "P ullman, Kinshasa",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "Oct.",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "29",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    side: const BorderSide(
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.green),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                              ),
                                              child: const Text(
                                                "Accepter",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    side: const BorderSide(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                              ),
                                              child: const Text(
                                                "Réfuser",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
