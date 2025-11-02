import 'package:flutter/material.dart';

class FidgetItemTile extends StatelessWidget {
  final String fidgetName;
  final String fidgetPrice;
  final String imagePath;
  void Function()? onPressed;

  FidgetItemTile({
    super.key,
    required this.fidgetName,
    required this.fidgetPrice,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(child: Image.asset(imagePath, height: 150)),

          MaterialButton(
            onPressed: onPressed,
            color: const Color(0xFF8eb1c9),
            child: Text(
              '\$$fidgetPrice',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
