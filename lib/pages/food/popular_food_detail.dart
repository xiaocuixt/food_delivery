import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class PopularFoodDetail extends StatefulWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  _PopularFoodDetailState createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopularFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/food1.jpeg"), fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ]),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 320,
          child: Container(
            padding: EdgeInsets.only(
                top: Dimensions.width20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppColumn(text: "Chinese Side"),
                SizedBox(
                  height: Dimensions.height20,
                ),
                BigText(text: "Introduce")
              ],
            ),
          ),
        )
      ]),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeigthBar,
        padding: EdgeInsets.only(
            top: Dimensions.height10,
            bottom: Dimensions.height10,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.height10,
                bottom: Dimensions.height10,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white),
            child: Row(
              children: [
                Icon(Icons.remove, color: AppColors.signColor),
                SizedBox(
                  width: Dimensions.width10 / 2,
                ),
                BigText(text: '0'),
                SizedBox(
                  width: Dimensions.width10 / 2,
                ),
                Icon(Icons.add, color: AppColors.signColor),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.height10,
                bottom: Dimensions.height10,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor),
            child: BigText(text: "\$10 | Add to cart", color: Colors.white),
          )
        ]),
      ),
    );
  }
}
