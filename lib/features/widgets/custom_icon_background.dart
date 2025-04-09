import 'package:devsoluionstask/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconBackground extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final Function() onPress;
  const CustomIconBackground({
    super.key,
    this.icon,
    required this.onPress,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 22,
      backgroundColor: APPGRAY,
      child:
          image != null
              ? InkWell(onTap: onPress, child: SvgPicture.asset(image!))
              : IconButton(
                icon: Icon(icon, color: Color(0xFF767676), size: 20),
                onPressed: onPress,
              ),
    );
  }
}
