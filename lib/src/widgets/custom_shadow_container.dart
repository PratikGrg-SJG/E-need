import 'package:flutter/material.dart';

import '../core/app/colors.dart';
import '../core/app/dimensions.dart';

class CustomShadowContainer extends StatelessWidget {
  final Widget? widget;
  final EdgeInsets? padding;
  final Color? bgColor;
  final Clip? clipBehavior;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  const CustomShadowContainer({
    super.key,
    this.widget,
    this.padding,
    this.bgColor,
    this.clipBehavior,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      height: height,
      width: MediaQuery.of(context).size.width,
      padding: padding ?? EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: bgColor ?? AppColor.kWhite,
        borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusSecond),
        boxShadow: [
          BoxShadow(
            color: Color(0xffB8B5B6).withOpacity(0.2),
            offset: Offset(0, 4),
            spreadRadius: 6,
            blurRadius: 10,
          )
        ],
      ),
      child: widget,
    );
  }
}
