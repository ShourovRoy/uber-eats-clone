import 'package:flutter/material.dart';
import 'package:infinitelist/pages/pickup_page.dart';
import 'package:infinitelist/pages/resturant_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? activeToggle;
  num? totalAmount;

  @override
  void initState() {
    super.initState();
    setState(() {
      activeToggle = "Delivery";
      totalAmount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerButton(activeToggle == "Delivery" ? true : false,
                          "Delivery"),
                      const SizedBox(width: 15.0),
                      headerButton(
                          activeToggle == "Pickup" ? true : false, "Pickup"),
                    ],
                  ),
                ),

                // search bar
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Colors.black54,
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                              color: Colors.black,
                            )),
                        suffixIcon: Container(
                          margin: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Icon(Icons.food_bank_rounded,
                              color: Colors.green),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 10.0),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(width: 1.5, color: Colors.black87)),
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ),
                ),

                // header slider menu
                Container(
                  color: Colors.white,
                  height: 70.0,
                  margin: const EdgeInsets.only(top: 7.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      headerTabItem("assets/menus/diet.png"),
                      headerTabItem("assets/menus/fast-food.png"),
                      headerTabItem("assets/menus/hamburger.png"),
                      headerTabItem("assets/menus/healthy-eating.png"),
                      headerTabItem("assets/menus/pizza.png"),
                      headerTabItem("assets/menus/salad.png"),
                      headerTabItem("assets/menus/diet.png"),
                      headerTabItem("assets/menus/harvest.png"),
                    ],
                  ),
                ),

                // render pages
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 7.0),
                    child: activeToggle == "Delivery"
                        ? const ResturantPage()
                        : const PickUpPage(),
                  ),
                )
              ],
            ),

            // Cart button
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Cart Amount $totalAmount\$"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xE9263238)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 60.0, vertical: 11.0)),
                      elevation: MaterialStateProperty.all(0.0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ))),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  // button widget
  Widget headerButton(bool isActive, String text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          activeToggle = text;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            isActive ? Colors.blueGrey.shade900 : Colors.transparent),
        elevation: MaterialStateProperty.all(0.0),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 37.0)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(
                width: 2.0,
                color: Colors.blueGrey.shade900,
                style: BorderStyle.solid),
          ),
        ),
      ),
    );
  }

  Widget headerTabItem(String imgUri) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Image.asset(
        imgUri,
        height: 40,
        width: 90,
      ),
    );
  }
}
