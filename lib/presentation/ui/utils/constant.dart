import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// --------------
/// Constant Color
/// --------------
Color primaryColor = const Color(0xFF0D314B);
Color secondColor = const Color(0xFFCAE3E1);
// Color secondColor = const Color(0xFFCAE3E1);
Color lightPrimaryColor = const Color(0xFF2AA9A9);
Color blackColor = const Color(0xFF000000);
Color grayColor = const Color(0xff999999);
Color graySoftColor = const Color(0xffF6F6F6);
const successColor = Color(0xFF04C104);
const dangerColor = Color(0xFFED170D);
const waringColor = Color(0xFFF6A51C);

/// --------------
/// Asset Location
/// --------------
String iconAsset = "assets/icons";
String imageAsset = "assets/image";
String animationAsset = "assets/animation";

/// ------------
/// Device Size
/// ------------
double deviceWidth() => ScreenUtil().screenWidth;
double deviceHeight() => ScreenUtil().screenHeight;

/// ----------------
/// Status Bar Color
/// ----------------
void setStatusBar({Brightness brightness = Brightness.dark}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, statusBarIconBrightness: brightness));
}

/// -----------------------------------
/// Font and size scaling screen utils
/// -----------------------------------
/// Initialize screen util
void setupScreenUtil(BuildContext context) =>
    ScreenUtil.init(context, minTextAdapt: true);

/// Setting height and width
double setWidth(double width) => ScreenUtil().setWidth(width);
double setHeight(double height) => ScreenUtil().setHeight(height);

/// Setting fontsize
double setFontSize(double size) => ScreenUtil().setSp(size);

/// -----------------------------------
/// Constant Base Text Styling
/// -----------------------------------
TextStyle styleHeader = TextStyle(
    fontSize: setFontSize(50), color: blackColor, fontWeight: FontWeight.w700);

TextStyle styleHeadLine = TextStyle(
  fontSize: setFontSize(44),
  color: blackColor,
);

TextStyle styleTitle = TextStyle(
    fontSize: setFontSize(26), color: blackColor, fontWeight: FontWeight.w700);

TextStyle stylePrice = TextStyle(
    fontSize: setFontSize(34),
    color: grayColor.withOpacity(0.7),
    fontWeight: FontWeight.w700);

TextStyle styleSubtitle =
    TextStyle(fontSize: setFontSize(32), color: blackColor);

TextStyle styleCategory = TextStyle(
    fontSize: setFontSize(32), color: blackColor, fontWeight: FontWeight.w700);

TextStyle styleCaption =
    TextStyle(fontSize: setFontSize(31), color: blackColor);
TextStyle styleCustom = const TextStyle();
