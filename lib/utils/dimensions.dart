import 'package:get/get.dart';

// 使用动态高度方案
class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // 3.84 = 屏幕高度除以盒子高度
  // 其它再有高度错误可以从padding, margin的top, bottom或者字号的大小改为动态值入手
  // 不同的设备radius也可以根据视高取动态值

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  // dynamic height
  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;

  // dynamic font size
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  // dynamic width, 可以动态设定左右间距等水平方向的值
  static double width10 = screenWidth / 84.4;
  static double width20 = screenWidth / 42.2;
  static double width30 = screenWidth / 28.13;

  // dynamic radius
  static double radius20 = screenWidth / 42.2;
  static double radius15 = screenWidth / 56.27;

  // list view size
  static double listViewImgSize = screenWidth / 3.25;
  // popular food
  static double popularFoodImgSize = screenHeight / 2.5;

  // bottom height
  static double bottomHeigthBar = screenHeight / 10;
}
