import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "DARLINGTON IBE",
            style: TextStyle(
              color: AppColors.gold,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: const [
              Text("Home", style: TextStyle(color: Colors.white)),
              SizedBox(width: 20),
              Text("About", style: TextStyle(color: Colors.white)),
              SizedBox(width: 20),
              Text("Skills", style: TextStyle(color: Colors.white)),
              SizedBox(width: 20),
              Text("Projects", style: TextStyle(color: Colors.white)),
              SizedBox(width: 20),
              Text("Contact", style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}