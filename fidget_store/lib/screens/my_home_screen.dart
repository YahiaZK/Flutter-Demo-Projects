import 'package:fidget_store/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/fidget_item_tile.dart';
import 'cart_screen.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartScreen();
            },
          ),
        ),
        backgroundColor: const Color(0xFF8eb1c9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(Icons.shopping_bag, color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            //good evening
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Good evening,'),
            ),

            SizedBox(height: 4),

            //let's get a new fidget today
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Find your perfect fidget today!',
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 24),

            // divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('New Fidgets', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 10),

            //gird of fidgets
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, cartModel, child) {
                  return GridView.builder(
                    itemCount: cartModel.shopItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return FidgetItemTile(
                        fidgetName: cartModel.shopItems[index][0],
                        fidgetPrice: cartModel.shopItems[index][1],
                        imagePath: cartModel.shopItems[index][2],
                        onPressed: () {
                          context.read<CartModel>().addItemToCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
