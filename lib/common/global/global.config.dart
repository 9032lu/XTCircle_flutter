// +----------------------------------------------------------------------
// | 全局设置
// | 本页面守则
// | 1. 所有设置项只能写在config类中
// | 2. 所有设置项尽量做到不可修改，只由人手修改相应值
// | 3. 全局性不可更改的设置都在本页面设置，如接口公共域名等，可更改或需要获取的，在状态管理中保存
// +----------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Config {
  // --------- 设置项 ---------

  /// 设置调试开关
  static bool debugEnv = true;

  /// 接口环境环境
  static String httpEnv = "production";

  /// 接口地址前缀
  static Map httpUrls = {
    "production": "http://www.xtquanzi.com/api/",
    "development": "https://oil.ittun.com/api/",
    "wbnb": "https://oil.ittun.com/api/",
  };

  /// 连接服务器超时时间，单位是毫秒.
  static int connectTimeout = 5000;

  /// 接收数据的最长时限，单位是毫秒.
  static int receiveTimeout = 2000;

  /// 是否开启沉浸式状态栏
  static bool immersive = true;

  /// 请求数据条数
  static int requestSize = 20;

  /// 状态栏的样式
  static SystemUiOverlayStyle statusBarStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  /// 屏幕方向 none不设置 column强制竖屏 row强制横屏
  static String screenDirection = "column";

  /// 状态栏 和 底部虚拟键 的开关控制 none两者都开启 top隐藏底部 bottom隐藏状态栏
  static String systemUiOverlay = "none";

  // --------- 设置项 ---------

  // --------- 读取项 ---------

  /// 调试状态(生产模式强制关闭debug)
  static bool get debug =>
      !bool.fromEnvironment("dart.vm.product") ? debugEnv : false;

  /// 当前接口前缀(生产模式强制production)
  static String get baseUrl => !bool.fromEnvironment("dart.vm.product")
      ? httpUrls[httpEnv]
      : httpUrls['production'];

  // --------- 读取项 ---------
}
