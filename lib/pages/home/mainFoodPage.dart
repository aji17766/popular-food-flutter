import 'package:e_commerce_app/pages/home/foodPageBody.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/bigText.dart';
import 'package:e_commerce_app/widgets/smallText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //header
          Container(
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: 'India',color: AppColors.mainColor,),
                          Row(
                            children: [
                              SmallText(text: 'Kerala',color: Colors.black54,),
                              Icon(Icons.arrow_drop_down_rounded)
                            ],
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          width: Dimensions.width45,
                          height: Dimensions.height45,
                          child: Icon(Icons.search,color: Colors.white,size:Dimensions.iconSize24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  )
              )
          ),
          //body
          Expanded(
              child: SingleChildScrollView(
                child:FoodPageBody(),
              ))
        ],
      )
    );
  }
}
