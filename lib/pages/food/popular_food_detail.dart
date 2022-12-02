import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/pages/home/mainFoodPage.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/app_column.dart';
import 'package:e_commerce_app/widgets/app_icons.dart';
import 'package:e_commerce_app/widgets/bigText.dart';
import 'package:e_commerce_app/widgets/expandable_text.dart';
import 'package:e_commerce_app/widgets/icon_and_text_widget.dart';
import 'package:e_commerce_app/widgets/smallText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
   PopularFoodDetail({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var product= Get.find<PopularProductController>().popularProductList[pageId];
   //print('pageId is'+pageId.toString());
  // print('product model'+product.name.toString());
    return Scaffold(
          backgroundColor: Colors.white,
           body: Stack(
             children: [
               //background image
               Positioned(
                   left: 0,
                   right: 0,
                   child: Container(
                     height: Dimensions.popularFoodImgSize,
                     width: double.maxFinite,
                     decoration: BoxDecoration(
                   color: Colors.white30,
                   image: DecorationImage(
                     image: NetworkImage(
                       AppConstants.BASE_URL+"/uploads/"+product.img!,
                     ),
                     fit: BoxFit.cover,
                   ),
                 ),
               )),
               //icon widgets
               Positioned(
                 left: Dimensions.width20,
                   right: Dimensions.width20,
                   top: Dimensions.height45,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      GestureDetector(
                          onTap:(){
                            Get.to(()=>MainFoodPage());
                          },
                          child: AppIcon(icon: Icons.arrow_back_ios)),
                       AppIcon(icon: Icons.shopping_cart_outlined)
                     ],
                   ),
               ),
               //introduction
               Positioned(
                 left: 0,
                 right: 0,
                 bottom: 0,
                 top: Dimensions.popularFoodImgSize-40,
                 child: Container(
                   padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(
                       topRight: Radius.circular(Dimensions.radius30),
                       topLeft: Radius.circular(Dimensions.radius30),
                     ),
                     color: Colors.white,
                   ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppColumn(text: product.name!),
                          SizedBox(height: Dimensions.height20),
                          BigText(text: 'Introduce'),
                          SizedBox(height: Dimensions.height20),
                          Expanded(child: SingleChildScrollView(
                            child: ExpandedTextWidget(text: product.description!,),
                          ),
                          )
                        ],
                      )
                 ),
               ),
             ],
           ), bottomNavigationBar: Container(
      height: Dimensions.bottomHeightBar,
      padding: EdgeInsets.symmetric(vertical: Dimensions.height30,horizontal: Dimensions.width30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius20*2),
            topLeft:  Radius.circular(Dimensions.radius20*2),
          ),
          color: AppColors.buttonBackgroungColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: Dimensions.width15,
                right: Dimensions.width20,
                top: Dimensions.height20,
                bottom: Dimensions.height20),
            width: Dimensions.cartWidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.remove,color: AppColors.signColor,),
                SizedBox(width: Dimensions.width10/2,),
                BigText(text: '0'),
                SizedBox(width: Dimensions.width10/2,),
                Icon(Icons.add,color: AppColors.signColor,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            child: BigText(text: '\$ ${product.price!} | Add to cart',
              color: Colors.white,),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor
            ),
          )

        ],
      ),
    ),

    );
  }
}
