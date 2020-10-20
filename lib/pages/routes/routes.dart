import 'package:flutter/material.dart';
import '../tabs/index.dart';

// 配置路由
final routes = {
  '/': (context) => Tabs(),
  // '/form': (context) => FormPage(),
  // '/category': (context) => CategoryPage(),
  '/home': (context) => HomePage(),
  '/conversation': (context) => ConversationPage,
  // '/search': (context, {arguments}) => SearchePage(arguments: arguments),
  '/shop': (context, {arguments}) => ShopPage(),

  '/mine': (context) => MinePage(),
  // '/user': (context) => UserCenterPage(),
  // '/textFiled': (context) => TextFiledPage(),
  // '/dataPicker': (context) => DataPickerPage(),
  // '/http': (context) => HttpPage(),
  // '/dio': (context) => DioRequestPage(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
//统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
