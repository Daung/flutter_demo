import 'dart:ui';

class WZDeviceInfo {
  //设备像素比
  static double dpr;
  //物理宽
  static double phyW;
  //物理高
  static double phyH;
  //设备的屏幕宽
  static double screenWidth;
  //设备的屏幕高
  static double screenHeight;
  //状态栏的高度
  static double statusBarHeight;

  static void iniDeviceInfo() {
    dpr = window.devicePixelRatio;
    phyW = window.physicalSize.width;
    phyH = window.physicalSize.height;

    screenWidth = phyW / dpr;
    screenHeight = phyH / dpr;
    statusBarHeight = window.padding.top / dpr;

    print("逻辑分辨率： $phyW * $phyH");
  }
}
