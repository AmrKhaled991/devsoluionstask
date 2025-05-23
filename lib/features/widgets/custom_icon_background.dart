import 'package:devsoluionstask/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconBackground extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final Color? backgroundColor;
  final Function() onPress;

  const CustomIconBackground({
    super.key,
    this.icon,
    required this.onPress,
    this.image,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: CircleAvatar(
        maxRadius: 22,
        backgroundColor: backgroundColor ?? APPGRAY,
        child:
            image != null
                ? InkWell(
                  onTap: onPress,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SvgPicture.asset(image!, width: 20),
                  ),
                )
                : Icon(icon, color: Color(0xFF767676), size: 20),
      ),
    );
  }
}
