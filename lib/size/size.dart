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
  //以iPhone 6 为模版， 不管什么屏幕尺寸，都除以750，
  //计算出来的像素比
  static double rpx;
  //iPhone 6 设备像素比 2 ， 所以一个点所占的像素 = rpx * 2;
  static double px;

  //以iPhone 6 为模版， 不管什么屏幕尺寸，都除以750，
  //iPhone 6 设备像素比 2 ， 所以一个点所占的像素 = rpx * 2;

  static void iniDeviceInfo({double standardSize = 750.0}) {
    dpr = window.devicePixelRatio;
    phyW = window.physicalSize.width;
    phyH = window.physicalSize.height;

    screenWidth = phyW / dpr;
    screenHeight = phyH / dpr;
    statusBarHeight = window.padding.top / dpr;

    print("逻辑分辨率： $phyW * $phyH");

    px = phyW / standardSize;
    rpx = phyW / standardSize * 2;
  }

  static double setRpx(double size) {
    double result = rpx * size;
    //测试下来，直接返回 rpx * size 会报错，把它复制给一个变量 在返回解决问题
    return result;
  }

  static double setPx(double size) {
    double result = px * size;
    //测试下来，直接返回 px * size 会报错，把它复制给一个变量 在返回解决问题
    return result;
  }
}
