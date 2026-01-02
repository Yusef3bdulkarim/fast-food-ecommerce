import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderIcon extends StatelessWidget {
  HeaderIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Color(0xFFfcf4e4),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: Icon(icon, size: 15, color: Color(0xff756d54)),
              ),
            ),
          ),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Color(0xfffcf4e4),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 15,
                color: Color(0xff756d54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
