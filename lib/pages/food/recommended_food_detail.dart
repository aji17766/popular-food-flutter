import 'package:e_commerce_app/controllers/recommended_product_controller.dart';
import 'package:e_commerce_app/routes/route_helper.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/app_icons.dart';
import 'package:e_commerce_app/widgets/bigText.dart';
import 'package:e_commerce_app/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class RecommendedFoodWidget extends StatelessWidget {
  int pageId;
  RecommendedFoodWidget({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    // print('pageId is'+pageId.toString());
    //  print('product model'+product.name.toString());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.toolSliverHeight,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap:(){
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                child: Center(child: BigText(size:Dimensions.font26,text: product.name!)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: Dimensions.height10/2,bottom: Dimensions.height10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  )
                ),
              )
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: Dimensions.screenHeight/2.73523809524,  //300
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+"/uploads/"+product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandedTextWidget(text:product.description!,
                  ),
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height45),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
            top: Dimensions.height10,
            bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize:Dimensions.iconSize24,
                    iconColor:Colors.white,
                    backGroundColor:AppColors.mainColor,
                    icon: Icons.remove),
                BigText(text: " \$ ${product.price!} "+" X "+" 0 ",color: AppColors.mainBlackColor,size: Dimensions.font26,),
                AppIcon(iconColor:Colors.white,
                    backGroundColor:AppColors.mainColor,
                    icon: Icons.add),

              ],
            ),
          ),
          Container(
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
                  padding: EdgeInsets.only(left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20,
                      bottom: Dimensions.height20),
                  width: Dimensions.cartWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius30)
                  ),
                  child: Icon(Icons.favorite,color: AppColors.mainColor,
                    size: Dimensions.recomIconSize30,
                  )
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
        ],
      ),
    );
  }
}
