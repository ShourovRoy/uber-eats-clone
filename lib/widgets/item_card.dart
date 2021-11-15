import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key,
      required this.imageUrl,
      required this.price,
      required this.title,
      required this.category})
      : super(key: key);

  final String imageUrl;
  final num price;
  final String title;
  final String category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300.0,
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      imageUrl,
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width,
                      height: 220.0,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 10.0,
                      width: 70.0,
                      child: Center(
                        child: CircleAvatar(
                          radius: 26,
                          backgroundColor: const Color(0xD9263238),
                          child: Text(
                            "\$$price",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                ListTile(
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19.0,
                    ),
                  ),
                  subtitle: Text(
                    "Category: $category",
                    style: const TextStyle(
                      fontSize: 12.6,
                    ),
                  ),
                  trailing: OutlinedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 17.0,
                          )),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.green[50])),
                      onPressed: () {},
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(fontSize: 13.0, color: Colors.black,),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
