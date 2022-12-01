import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ExpandedTextWidget extends StatelessWidget {
  final String text;
  const ExpandedTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReadMoreText(text, trimLines: 3,
        textAlign: TextAlign.justify,
        trimMode: TrimMode.Line,
        trimCollapsedText: "Show More",
        trimExpandedText: "Show Less",
        lessStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.mainColor,
        ),
        moreStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.mainColor,
        ),
        style: TextStyle(
          fontSize:Dimensions.font16,
          height:Dimensions.screenHeight/410.285714286
        ),
      ),
    );
  }
}


