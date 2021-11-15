import 'package:flutter/material.dart';
import 'package:infinitelist/widgets/item_card.dart';

class ResturantPage extends StatefulWidget {
  const ResturantPage({Key? key}) : super(key: key);

  @override
  _ResturantPageState createState() => _ResturantPageState();
}

class _ResturantPageState extends State<ResturantPage> {
  List allItems = const [
    ItemCard(
        imageUrl: "assets/food/veg-one.jpg",
        title: "Green Vegetables",
        price: 80,
        category: "Vegetables"),
    ItemCard(
        imageUrl: "assets/food/combo_pack_offer.jpg",
        title: "Combo Offer",
        price: 73,
        category: "Fast Food"),
    ItemCard(
        imageUrl: "assets/food/burger.jpg",
        title: "Burger",
        price: 20,
        category: "Fast Food"),
    ItemCard(
        imageUrl: "assets/food/pasta.jpg",
        title: "Special Pasta",
        price: 40,
        category: "Fast Food"),
    ItemCard(
        imageUrl: "assets/food/dim.jpg",
        title: "Snack Pack",
        price: 20,
        category: "Fast Food"),
    ItemCard(
        imageUrl: "assets/food/salad.jpg",
        title: "Healthy Salad",
        price: 40,
        category: "Vegetables, Salad"),
    ItemCard(
        imageUrl: "assets/food/special-pizza.jpg",
        title: "Green Veg",
        price: 90,
        category: "Fast Food"),
    ItemCard(
        imageUrl: "assets/food/noodls.jpg",
        title: "Thai Noodles",
        price: 30,
        category: "Fast Food"),


  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => ItemCard(
            imageUrl: allItems[index].imageUrl, price: allItems[index].price, title: allItems[index].title, category: allItems[index].category),
            itemCount: allItems.length,
      ),
    );
  }
}
