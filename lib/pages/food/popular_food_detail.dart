import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_proudct_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    print(RouteHelper.getPopularFood(pageId));
    print(product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        // background image
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img,
                ),
              ),
            ),
          ),
        ),
        // icon widgets
        Positioned(
          top: 45,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getInitial());
              },
              child: AppIcon(icon: Icons.arrow_back_ios),
            ),
            GetBuilder<PopularProductController>(builder: (controller) {
              return Stack(
                children: [
                  AppIcon(icon: Icons.shopping_cart_outlined),
                  Get.find<PopularProductController>().TotalItems > 1
                      ? Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                              child: AppIcon(
                            icon: Icons.circle,
                            size: 20,
                            iconColor: Colors.transparent,
                            backgroudColor: AppColors.mainColor,
                          )),
                        )
                      : Container(),
                  Get.find<PopularProductController>().TotalItems > 1
                      ? Positioned(
                          right: 3,
                          top: 3,
                          child: BigText(
                            text: Get.find<PopularProductController>()
                                .TotalItems
                                .toString(),
                            size: 12,
                            color: Colors.white,
                          ))
                      : Container(),
                ],
              );
            })
          ]),
        ),
        // Introduction
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
                AppColumn(text: product.name),
                SizedBox(
                  height: Dimensions.height20,
                ),
                BigText(text: "Introduce"),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ExpandableTextWidget(text: product.description),
                  ),
                )
              ],
            ),
          ),
        )
        // Expandable text widget
      ]),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
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
                  GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(Icons.remove, color: AppColors.signColor)),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: popularProduct.inCartItems.toString()),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(Icons.add, color: AppColors.signColor)),
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
              child: GestureDetector(
                onTap: () {
                  popularProduct.addItem(product);
                },
                child: BigText(
                    text: "\$ ${product.price}" + "| Add to cart",
                    color: Colors.white),
              ),
            )
          ]),
        );
      }),
    );
  }
}
