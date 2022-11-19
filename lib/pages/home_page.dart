import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_title.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartPage();
          },),);
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40.0,
          ),
          //good morning ,msg
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("good morning"),
          ),
          const SizedBox(
            height: 4.0,
          ),
          //Let's oder fresh items for you
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Let's order fresh items for you",
              style: GoogleFonts.notoSerif(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          //divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          //refresh items + geid
          Expanded(
            child: Consumer<CartModel> (
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItem.length,
                padding: const EdgeInsets.all(10.0),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1/1.2,),
                itemBuilder: (context, index) {
                return GroceryItemTitle(
                  itemName: value.shopItem[index][0],
                  itemPrice: value.shopItem[index][1],
                  imagePath: value.shopItem[index][2],
                  color: value.shopItem[index][3],
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                  },
                );
                },
                );
              }
    ),
          ),
        ],
      ),
    );
  }
}
