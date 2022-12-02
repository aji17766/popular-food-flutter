import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/bigText.dart';
import 'package:e_commerce_app/widgets/icon_and_text_widget.dart';
import 'package:e_commerce_app/widgets/smallText.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: text,size: Dimensions.font26,),
          SizedBox(height: Dimensions.height10,),
          Row(
            children: [
              Wrap(
                children: List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,)),
              ),
              SizedBox(width: 10,),
              SmallText(text: '4.5'),
              SizedBox(width: 10,),
              SmallText(text: '1287'),
              //SizedBox(width: 10,),
              SmallText(text: 'comments'),
            ],
          ),
          SizedBox(height: Dimensions.height10,),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(icon: Icons.circle_sharp,
                  text: 'Normal',
                  iconColor: AppColors.iconColor1),
              IconAndTextWidget(icon: Icons.location_on,
                  text: '1,7km',
                  iconColor: AppColors.mainColor),
              IconAndTextWidget(icon: Icons.access_time_rounded,
                  text: '32min',
                  iconColor: AppColors.iconColor2),
            ],
          )
        ],
      ),
    );
  }
}
