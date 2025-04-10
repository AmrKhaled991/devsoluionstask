import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget widget;

  const CustomCard({super.key, required this.widget});
   
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x26717171),
            blurRadius: 10,
            offset: Offset(-2, 2),
            spreadRadius: -1,
          )
        ],
      ),
      child:widget  
      
      
      );
  }
}
